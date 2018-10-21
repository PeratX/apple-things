//
//  ReverseProxyServer.swift
//  Created by PeratX on 2018/10/21.
//

import PerfectHTTP
import PerfectHTTPServer

public class Kyrios {
    public let NAME = "iTXTech Kyrios"
    
    private var httpServer: HTTPServer.Server?
    private var httpsServer: HTTPServer.Server?
    
    public init(tlsConfig: TLSConfiguration, addr: String, httpPort: Int, httpsPort: Int){
        let route = Route(methods: HTTPMethod.allMethods, uri: "/**", handler: handleRequest)
        var routes = Routes()
        routes.add(route)
        httpServer = HTTPServer.Server(name: NAME + " (HTTP}", address: addr, port: httpPort, routes: routes)
        httpsServer = HTTPServer.Server(tlsConfig: tlsConfig, name: NAME + " (HTTPS)", address: addr, port: httpsPort, routes: routes)
        do{
            try HTTPServer.launch([httpServer!, httpsServer!])
        } catch {
            print(error)
        }
    }
    
    private func handleRequest(request: HTTPRequest, response: HTTPResponse){
        print(request.uri)
        response.setHeader(.custom(name: "X-Server-Powered"), value: NAME)
        response.setHeader(.contentType, value: "text/plain")
        response.appendBody(string: "Succ!")
        response.completed();
    }
    
}
