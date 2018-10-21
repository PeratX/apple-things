//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectHTTP
import PerfectHTTPServer


var tlsConfig = TLSConfiguration.init(certPath: "/Users/peratx/Desktop/dev/CertGen/cert.crt", keyPath: "/Users/peratx/Desktop/dev/CertGen/private.key")
Kyrios(tlsConfig: tlsConfig, addr: "127.0.0.1", httpPort: 8080, httpsPort: 8043)
