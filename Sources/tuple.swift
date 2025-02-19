//
//  tuple.swift
//  raytracing-challenge
//
//  Created by matty on 2/18/25.
//

enum TupleType {
    case point, vec
}

struct Tuple {
    var x: Float
    var y: Float
    var z: Float
    var w: Float {
        get {
            switch type {
            case .point: 1
            case .vec: 0
            }
        }
    }
    let type: TupleType
    
    init(x: Float, y: Float, z: Float, w: Float) {
        self.x = x
        self.y = y
        self.z = z
        if w == 1.0 {
            self.type = .point
        } else if w == 0.0 {
            self.type = .vec
        } else {
            fatalError("Nonsense!")
        }
    }
}

func point(x: Float, y: Float, z: Float) -> Tuple {
    Tuple(x: x, y: y, z: z, w: 1)
}

func vec(x: Float, y: Float, z: Float) -> Tuple {
    Tuple(x: x, y: y, z: z, w: 0)
}

func ==(lhs: Tuple, rhs: Tuple) -> Bool {
    equal(x: lhs.x, y: rhs.x) && equal(x: lhs.y, y: rhs.y) && equal(x: lhs.z, y: rhs.z) && equal(x: lhs.w, y: rhs.w)
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
