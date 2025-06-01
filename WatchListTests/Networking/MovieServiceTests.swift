//
//  MovieServiceTests.swift
//  WatchListTests
//
//  Created by ARMIAMAC on 01/06/25.
//

import XCTest
@testable import WatchList

final class MovieServiceTests: XCTestCase {

    var movieService: MovieService!
    
    override func setUpWithError() throws {
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let mockSession = URLSession(configuration: config)
        movieService = MovieService(session: mockSession)
    }

    override func tearDownWithError() throws {
        movieService = nil
    }
    
    func testFetchMoviesSuccess() throws {
        let json = """
            {
                "results": [
                    { "id": 1, "original_title": "Movie One" },
                    { "id": 2, "original_title": "Movie Two" }
                ]
            }
            """
        let data = json.data(using: .utf8)
        MockURLProtocol.mockResponse = (data, nil, nil)
        
        let expectation = self.expectation(description: "Movies fetched")
        
        movieService.fetchPopularMovies { result in
            switch result {
            case .success(let movies):
                XCTAssertEqual(movies.count, 2)
                XCTAssertEqual(movies.first?.originalTitle, "Movie One")
            case .failure:
                XCTFail("Expected success but got failure")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testFetchMoviesInvalidJSON() throws {
        let json = "{ invalid json }"
        let data = json.data(using: .utf8)
        MockURLProtocol.mockResponse = (data, nil, nil)
        
        let expectation = self.expectation(description: "Parsing failure")
        
        movieService.fetchPopularMovies { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testFetchPopularMoviesWithNetworkError() throws {
        let error = NSError(domain: "Network", code: -1009)
        MockURLProtocol.mockResponse = (nil, nil, error)
        
        let expectation = self.expectation(description: "Network error")
        
        movieService.fetchPopularMovies { result in
            switch result {
            case .success:
                XCTFail("Expected failure due to network error")
            case .failure(let err):
                XCTAssertEqual((err as NSError).code, -1009)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }

}
