import Foundation

public class SSDPService {
    var location: String?
    var server: String?
    var searchTarget: String?
    var uniqueServiceName: String?

    // MARK: Initialisation

    /**
        Initialize the `SSDPService` with the discovery response.

        - Parameter response: The discovery response.
    */
    init(response: String) {
        self.location = self.parse(header: "LOCATION", in: response)
        self.server = self.parse(header: "SERVER", in: response)
        self.searchTarget = self.parse(header: "ST", in: response)
        self.uniqueServiceName = self.parse(header: "USN", in: response)
    }

    // MARK: Private functions

    /**
        Parse the discovery response.

        - Parameters:
            - header: The header to parse.
            - response: The discovery response.
    */
    private func parse(header: String, in response: String) -> String? {
        if let range = response.range(of: "\(header): .*", options: .regularExpression) {
            var value = response.substring(with: range)
            value = value.replacingOccurrences(of: "\(header): ", with: "")
            return value
        }
        return nil
    }
}