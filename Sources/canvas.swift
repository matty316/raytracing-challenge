//
//  canvas.swift
//  raytracing-challenge
//
//  Created by Matthew Reed on 2/19/25.
//

import Foundation

struct Canvas {
    let width: Int
    let height: Int
    var pixels: [[Tuple]]
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        
        var pixels = [[Tuple]]()
        for x in 0..<width {
            pixels.append([Tuple]())
            for _ in 0..<height {
                pixels[x].append(color(0, 0, 0))
            }
        }
        self.pixels = pixels
    }
    
    mutating func write(_ x: Int, _ y: Int, _ c: Tuple) {
        pixels[x][y] = c
    }
    
    func pixelAt(_ x: Int, _ y: Int) -> Tuple {
        pixels[x][y]
    }
    
    func ppm() -> PPM {
        return PPM(
            width: width,
            height: height,
            header: "P3\n\(width) \(height)\n255",
            body: ppmBody()
        )
    }
    
    private func ppmBody() -> String {
        var body = ""
        
        var charCount = 0
        for x in 0..<width {
            for y in 0..<height {
                let pixel = pixels[x][y]
                let r = pixel.r
                let g = pixel.g
                let b = pixel.b
                
                var ir = Int(round(r * 255))
                var ig = Int(round(g * 255))
                var ib = Int(round(b * 255))
                
                ir = clamp(ir)
                ig = clamp(ig)
                ib = clamp(ib)
                
                
            }
        }
        body = body.trimmingCharacters(in: .whitespacesAndNewlines)
        return body
    }
    
    private func addToBody() -> String {
        ""
    }
    
    func clamp(_ val: Int, min: Int = 0, max: Int = 255) -> Int {
        if val > max {
            return max
        }
        if val < min {
            return min
        }
        return val
    }
}

struct PPM {
    let width: Int
    let height: Int
    let header: String
    let body: String
    
    func string() -> String {
        return """
\(header)
\(body)\n
"""
    }
}
