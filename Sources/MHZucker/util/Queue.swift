//
//  Queue.swift
//
// Created by Mohamed Emad Abdalla Hegab on 30.01.18.
//

import UIKit

struct Queue {

    static let main = Queue(queue: DispatchQueue.main)
    static let background = Queue(queue: .global(qos: .background))

    let queue: DispatchQueue
    init(queue: DispatchQueue) {
        self.queue = queue
    }

    func async(_ block: @escaping () -> Void) {
        queue.async(execute: block)
    }

    func sync(_ block: () -> Void) {
        queue.sync(execute: block)
    }

    func after(_ time: TimeInterval, block: @escaping () -> Void) {
        queue.asyncAfter(deadline: DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: block)
    }

    func notifyGroup(_ group: DispatchGroup, block: @escaping () -> Void) {
        group.notify(queue: queue, execute: block)
    }
}
