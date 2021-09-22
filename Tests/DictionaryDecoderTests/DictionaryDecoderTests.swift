import XCTest
@testable import DictionaryDecoder

final class DictionaryDecoderTests: XCTestCase {

    struct CustomType: Decodable {
        let id: Int
        let description: String
        let nested: NestedType
    }

    struct NestedType: Decodable {
        let nestedDescription: String
    }

    func testDecode() throws {

        let testDictionary: [AnyHashable: Any] = [
            "id": 123,
            "description": "string",
            "nested": ["nestedDescription": "Nested description"]
        ]

        let object = try DictionaryDecoder().decode(CustomType.self, from: testDictionary)

        XCTAssertEqual(object.id, 123)
        XCTAssertEqual(object.nested.nestedDescription, "Nested description")
    }
}
