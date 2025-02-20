//
//  tuple.swift
//  raytracing-challenge
//
//  Created by matty on 2/18/25.
//

import Foundation

enum TupleType {
    case point, vec, color, none
}

struct Tuple {
    var x: Float
    var y: Float
    var z: Float
    var w: Float
    
    var r: Float { x }
    var g: Float { y }
    var b: Float { z }
    
    let type: TupleType
    
    init(x: Float, y: Float, z: Float, w: Float, type: TupleType? = nil) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
        if let type = type {
            self.type = type
        } else {
            if equal(w, 1.0) {
                self.type = .point
            } else if equal(w, 0.0) {
                self.type = .vec
            } else {
                self.type = .none
            }
        }
    }
    
    func magnitude() -> Float {
        sqrt(x * x + y * y + z * z + w * w)
    }
    
    func normalize() -> Tuple {
        Tuple(
            x: x / magnitude(),
            y: y / magnitude(),
            z: z / magnitude(),
            w: w / magnitude()
        )
    }
}

func point(x: Float, y: Float, z: Float) -> Tuple {
    Tuple(x: x, y: y, z: z, w: 1)
}

func vec(x: Float, y: Float, z: Float) -> Tuple {
    Tuple(x: x, y: y, z: z, w: 0)
}

func color(_ r: Float, _ g: Float, _ b: Float) -> Tuple {
    Tuple(x: r, y: g, z: b, w: 0, type: TupleType.color)
}

func ==(lhs: Tuple, rhs: Tuple) -> Bool {
    equal(lhs.x, rhs.x) && equal(lhs.y, rhs.y) && equal(lhs.z, rhs.z) && equal(lhs.w, rhs.w)
}

func !=(lhs: Tuple, rhs: Tuple) -> Bool {
    !(lhs == rhs)
}

func +(lhs: Tuple, rhs: Tuple) -> Tuple {
    Tuple(
        x: lhs.x + rhs.x,
        y: lhs.y + rhs.y,
        z: lhs.z + rhs.z,
        w: lhs.w + rhs.w
    )
}

func -(lhs: Tuple, rhs: Tuple) -> Tuple {
    Tuple(
        x: lhs.x - rhs.x,
        y: lhs.y - rhs.y,
        z: lhs.z - rhs.z,
        w: lhs.w - rhs.w
    )
}

prefix func -(rhs: Tuple) -> Tuple {
    Tuple(
        x: -rhs.x,
        y: -rhs.y,
        z: -rhs.z,
        w: -rhs.w
    )
}

func *(lhs: Tuple, rhs: Float) -> Tuple {
    Tuple(
        x: lhs.x * rhs,
        y: lhs.y * rhs,
        z: lhs.z * rhs,
        w: lhs.w * rhs
    )
}

func /(lhs: Tuple, rhs: Float) -> Tuple {
    lhs * (1 / rhs)
}

func dot(_ lhs: Tuple, _ rhs: Tuple) -> Float {
    lhs.x * rhs.x + lhs.y * rhs.y + lhs.z * rhs.z + lhs.w * rhs.w
}

func cross(_ lhs: Tuple, _ rhs: Tuple) -> Tuple {
    vec(
        x: lhs.y * rhs.z - lhs.z * rhs.y,
        y: lhs.z * rhs.x - lhs.x * rhs.z,
        z: lhs.x * rhs.y - lhs.y * rhs.x
    )
}

func *(lhs: Tuple, rhs: Tuple) -> Tuple {
    Tuple(
        x: lhs.x * rhs.x,
        y: lhs.y * rhs.y,
        z: lhs.z * rhs.z,
        w: lhs.w * rhs.w
    )
}
