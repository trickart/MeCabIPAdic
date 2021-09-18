import XCTest
@testable import MeCabObjC
@testable import MeCabIPAdic

final class MeCabIPAdicTests: XCTestCase {
    func testBundle() {
        let fileManager = FileManager.default
        guard let urls = try? fileManager.contentsOfDirectory(at: MeCabIPAdic.url, includingPropertiesForKeys: nil) else {
            XCTFail()
            return
        }
        let contents = urls.map(\.lastPathComponent)
        XCTAssertTrue(contents.contains("char.bin"))
        XCTAssertTrue(contents.contains("dicrc"))
        XCTAssertTrue(contents.contains("left-id.def"))
        XCTAssertTrue(contents.contains("matrix.bin"))
        XCTAssertTrue(contents.contains("pos-id.def"))
        XCTAssertTrue(contents.contains("rewrite.def"))
        XCTAssertTrue(contents.contains("right-id.def"))
        XCTAssertTrue(contents.contains("sys.dic"))
        XCTAssertTrue(contents.contains("unk.dic"))
    }

    func testParse() {
        let tagger = Tagger(url: MeCabIPAdic.url)
        let nodes = tagger.parseNode("すもももももももものうち")
        XCTAssertEqual(nodes.compactMap(\.surface), ["すもも", "も", "もも", "も", "もも",  "の", "うち"])
    }
}
