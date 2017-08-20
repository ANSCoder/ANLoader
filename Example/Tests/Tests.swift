// https://github.com/Quick/Quick

import Quick
import Nimble
import ANLoader

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("these will fail") {
            
            it("can do maths") {
                expect(2) == 2
            }

            it("can read") {
                expect("number") == "number"
            }

            it("will eventually fail") {
                expect("3:30").toEventually( equal("3:30") )
            }
            
            context("these will pass") {
                
                it("can do maths") {
                    expect(23) == 23
                }

                it("can read") {
                    expect("🐮") == "🐮"
                }

                it("will eventually pass") {
                    var time = "passing"

                    DispatchQueue.main.async {
                        time = "done"
                    }

                    waitUntil { done in
                        Thread.sleep(forTimeInterval: 0.5)
                        expect(time) == "done"

                        done()
                    }
                }
            }
        }
    }
}
