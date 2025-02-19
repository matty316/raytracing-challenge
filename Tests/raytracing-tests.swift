//
//  raytracing-tests.swift
//  raytracing-challenge
//
//  Created by matty on 2/18/25.
//

import Testing
@testable import raytracing_challenge

struct RaytracingTests {
    @Test func testTuples() {
        let point0 = Tuple(x: 4.3, y: -4.2, z: 3.1, w: 1)
        #expect(point0.type == .point)
        #expect(point0.x == 4.3)
        #expect(point0.y == -4.2)
        #expect(point0.z == 3.1)
        #expect(point0.w == 1.0)
        
        let vec0 = Tuple(x: 4.3, y: -4.2, z: 3.1, w: 0)
        #expect(vec0.type == .vec)
        #expect(vec0.x == 4.3)
        #expect(vec0.y == -4.2)
        #expect(vec0.z == 3.1)
        #expect(vec0.w == 0.0)
        
        let point1 = point(x: 4, y: -4, z: 3)
        #expect(point1.type == .point)
        #expect(point1.x == 4.0)
        #expect(point1.y == -4.0)
        #expect(point1.z == 3.0)
        #expect(point1.w == 1.0)
        
        let vec1 = vec(x: 4, y: -4, z: 3)
        #expect(vec1.type == .vec)
        #expect(vec1.x == 4.0)
        #expect(vec1.y == -4.0)
        #expect(vec1.z == 3.0)
        #expect(vec1.w == 0.0)
    }
    
    @Test func testCompareFloats() {
        let x: Float = 0.000000001
        let y: Float = 0.0000000012
        
        //close enough
        #expect(equal(x: x, y: y))
    }
    
    @Test func testTuplesEqual() {
        let point0 = point(x: 4, y: -4, z: 3)
        let point1 = point(x: 4, y: -4, z: 3)
        
        #expect(point0 == point1)
        
        let vec0 = vec(x: 4, y: -4, z: 3)
        let vec1 = vec(x: 4, y: -4, z: 3)
        
        #expect(vec0 == vec1)
        
        #expect(point0 != vec0)
        
        let vec2 = vec(x: 4, y: -2, z: 3)
        
        #expect(vec0 != vec2)
    }
    
    @Test func testAddTuples() {
        let a0 = Tuple(x: 3, y: -2, z: 5, w: 1)
        let a1 = Tuple(x: -2, y: 3, z: 1, w: 0)
        #expect(a0 + a1 == Tuple(x: 1, y: 1, z: 6, w: 1))
    }
    
    @Test func testSubTuples() {
        let p0 = point(x: 3, y: 2, z: 1)
        let p1 = point(x: 5, y: 6, z: 7)
        #expect(p0 - p1 == vec(x: -2, y: -4, z: -6))
        
        let v0 = vec(x: 3, y: 2, z: 1)
        let v1 = vec(x: 5, y: 6, z: 7)
        #expect(v0 - v1 == vec(x: -2, y: -4, z: -6))
        
        #expect(p0 - v1 == point(x: -2, y: -4, z: -6))
    }
    
    @Test func testNegateTuple() {
        let zero = vec(x: 0, y: 0, z: 0)
        let v = vec(x: 1, y: -2, z: 3)
        let exp = vec(x: -1, y: 2, z: -3)
        
        #expect(zero - v == exp)
        #expect(-v == exp)
    }
}
