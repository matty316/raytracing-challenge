//
//  raytracing-tests.swift
//  raytracing-challenge
//
//  Created by matty on 2/18/25.
//

import Testing
import Foundation
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
        #expect(equal(x, y))
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
        
        let t = Tuple(x: 1, y: -2, z: 3, w: -4)
        #expect(-t == Tuple(x: -1, y: 2, z: -3, w: 4))
    }
    
    @Test func testMulTupleByScaler() {
        let a = Tuple(x: 1, y: -2, z: 3, w: -4)
        #expect(a * 3.5 == Tuple(x: 3.5, y: -7, z: 10.5, w: -14))
        #expect(a * 0.5 == Tuple(x: 0.5, y: -1, z: 1.5, w: -2))
    }
    
    @Test func testDivTupleByScaler() {
        let a = Tuple(x: 1, y: -2, z: 3, w: -4)
        #expect(a / 2 == Tuple(x: 0.5, y: -1, z: 1.5, w: -2))
    }
    
    @Test func testGetMagnitude() {
        var v = vec(x: 1, y: 0, z: 0)
        #expect(equal(v.magnitude(), 1))
        v = vec(x: 0, y: 1, z: 0)
        #expect(equal(v.magnitude(), 1))
        v = vec(x: 0, y: 0, z: 1)
        #expect(equal(v.magnitude(), 1))
        v = vec(x: 1, y: 2, z: 3)
        #expect(equal(v.magnitude(), sqrt(14)))
        v = vec(x: -1, y: -2, z: -3)
        #expect(equal(v.magnitude(), sqrt(14)))
    }
    
    @Test func testNormalize() {
        var v = vec(x: 4, y: 0, z: 0)
        #expect(v.normalize() == vec(x: 1, y: 0, z: 0))
        
        v = vec(x: 1, y: 2, z: 3)
        #expect(v.normalize() == vec(x: 0.26726, y: 0.53452, z: 0.80178))
        
        #expect(equal(v.normalize().magnitude(), 1))
    }
    
    @Test func testDotProduct() {
        let a = vec(x: 1, y: 2, z: 3)
        let b = vec(x: 2, y: 3, z: 4)
        #expect(equal(dot(a, b), 20))
    }
    
    @Test func testCrossProduct() {
        let a = vec(x: 1, y: 2, z: 3)
        let b = vec(x: 2, y: 3, z: 4)
        
        #expect(cross(a, b) == vec(x: -1, y: 2, z: -1))
        #expect(cross(b, a) == vec(x: 1, y: -2, z: 1))
    }
    
    @Test func testColor() {
        let color = color(-0.5, 0.4, 1.7)
        #expect(equal(color.r, -0.5))
        #expect(equal(color.g, 0.4))
        #expect(equal(color.b, 1.7))
        #expect(color.type == .color)
    }
    
    @Test func testColorOperations() {
        let c0 = color(0.9, 0.6, 0.75)
        let c1 = color(0.7, 0.1, 0.25)
        #expect(c0 + c1 == color(1.6, 0.7, 1.0))
        #expect(c0 - c1 == color(0.2, 0.5, 0.5))
        let c3 = color(0.2, 0.3, 0.4)
        #expect(c3 * 2 == color(0.4, 0.6, 0.8))
        let c4 = color(1, 0.2, 0.4)
        let c5 = color(0.9, 1, 0.1)
        #expect(c4 * c5 == color(0.9, 0.2, 0.04))
    }
    
    @Test func testCreateCanvas() {
        let c = Canvas(width: 10, height: 20)
        #expect(c.width == 10)
        #expect(c.height == 20)
        for pixelArray in c.pixels {
            for pixel in pixelArray {
                #expect(pixel == color(0, 0, 0))
            }
        }
    }
    
    @Test func writePixelToCanvas() {
        var c = Canvas(width: 10, height: 20)
        let red = color(1, 0, 0)
        c.write(2, 3, red)
        #expect(c.pixelAt(2, 3) == red)
    }
    
    @Test func testCanvasToPPMHeader() {
        let c = Canvas(width: 5, height: 3)
        let ppm = c.ppm()
        let header = """
P3
5 3
255
"""
        #expect(ppm.header == header)
    }
    
    @Test func testPPMData() {
        var c = Canvas(width: 5, height: 3)
        let c0 = color(1.5, 0, 0)
        let c1 = color(0, 0.5, 0)
        let c2 = color(-0.5, 0, 1)
        c.write(0, 0, c0)
        c.write(2, 1, c1)
        c.write(4, 2, c2)
        let ppm = c.ppm()
        print(c.pixels)
        let body = """
255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 128 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 255
"""
        #expect(ppm.body == body)
    }
    
    @Test func testPPMLongLines() {
        let body = """
255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
"""
        
        var c = Canvas(width: 10, height: 2)
        for x in 0..<10 {
            for y in 0..<2 {
                c.write(x, y, color(1, 0.8, 0.6))
            }
        }
        let ppm = c.ppm()
        #expect(ppm.body == body)
    }
    
    @Test func testPPMEndsInNewline() {
        let c = Canvas(width: 5, height: 3)
        let ppm = c.ppm()
        let ppmString = ppm.string()
        #expect(ppmString.last == "\n")
    }
    
    @Test func testPPMString() {
        let string = """
P3
10 10
255
255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 153

"""
        var c = Canvas(width: 10, height: 10)
        for x in 0..<10 {
            for y in 0..<10 {
                c.write(x, y, color(1, 0.8, 0.6))
            }
        }
        #expect(c.ppm().string() == string)
    }
}
