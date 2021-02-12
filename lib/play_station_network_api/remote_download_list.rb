
# __d(
#     function (g, r, i, a, m, e, d) {
#       var t, n;
#       (t = this),
#         (n = function (t, n) {
#           "use strict";
#           (t = "default" in t ? t.default : t),
#             (n = "default" in n ? n.default : n);
#           var o =
#             Object.assign ||
#             function (t) {
#               for (var n = 1; n < arguments.length; n++) {
#                 var o = arguments[n];
#                 for (var s in o)
#                   Object.prototype.hasOwnProperty.call(o, s) && (t[s] = o[s]);
#               }
#               return t;
#             };
#           function s() {
#             return t.generateUuid().replace(/-/g, "").substring(0, 16);
#           }
#           function u() {
#             var n =
#                 arguments.length > 0 && void 0 !== arguments[0]
#                   ? arguments[0]
#                   : {},
#               o = t.generateUuid(),
#               u = s();
#             return {
#               "X-Psn-Request-Id": o,
#               "X-Psn-Sampled": "0",
#               "X-Psn-Span-Id": s(),
#               "X-Psn-Trace-Id": u,
#               "X-Psn-App-Ver": n.appVersion
#             };
#           }
#           function p(t) {
#             var n =
#                 arguments.length > 1 && void 0 !== arguments[1]
#                   ? arguments[1]
#                   : {},
#               s = u(t);
#             return o(s, n);
#           }
#           var c =
#               Object.assign ||
#               function (t) {
#                 for (var n = 1; n < arguments.length; n++) {
#                   var o = arguments[n];
#                   for (var s in o)
#                     Object.prototype.hasOwnProperty.call(o, s) && (t[s] = o[s]);
#                 }
#                 return t;
#               },
#             l = "psn:accessToken:std",
#             v = "acceptLanguage",
#             y = "std:remoteDownloadList";
#           var f = {
#             name: "remoteDownloadList",
#             templates: Object.freeze({
#               scheduleDownload: function (t, n) {
#                 var o = t || {},
#                   s = o.queryParams,
#                   u = void 0 === s ? {} : s,
#                   f = o.headers,
#                   h = o.body;
#                 return {
#                   authType: l,
#                   apiGroup: y,
#                   languageType: v,
#                   method: "POST",
#                   endpoint: "/v2/add",
#                   urlParams: {},
#                   body: h,
#                   queryParams: u,
#                   headers: c({ "Content-Type": "application/json" }, p(n, f))
#                 };
#               },
#               getDownloadStatuses: function (t, n) {
#                 var o = t || {},
#                   s = o.queryParams,
#                   u = void 0 === s ? {} : s,
#                   c = o.headers;
#                 return {
#                   authType: l,
#                   apiGroup: y,
#                   languageType: v,
#                   method: "GET",
#                   endpoint: "/v2/status",
#                   urlParams: {},
#                   queryParams: u,
#                   headers: p(n, c)
#                 };
#               },
#               updateDownloadStatus: function (t, n) {
#                 var o = t || {},
#                   s = o.queryParams,
#                   u = void 0 === s ? {} : s,
#                   f = o.headers,
#                   h = o.body;
#                 return {
#                   authType: l,
#                   apiGroup: y,
#                   languageType: v,
#                   method: "POST",
#                   endpoint: "/v2/status",
#                   urlParams: {},
#                   body: h,
#                   queryParams: u,
#                   headers: c({ "Content-Type": "application/json" }, p(n, f))
#                 };
#               },
#               closeAccountAndDeleteData: function (t, n) {
#                 var o = t || {},
#                   s = o.accountId,
#                   u = o.queryParams,
#                   c = void 0 === u ? {} : u,
#                   f = o.headers;
#                 return {
#                   authType: l,
#                   apiGroup: y,
#                   languageType: v,
#                   method: "GET",
#                   endpoint: "/v2/closure/account/{accountId}",
#                   urlParams: { accountId: s },
#                   queryParams: c,
#                   headers: p(n, f)
#                 };
#               }
#             }),
#             defaultBaseUrls: {
#               "std:remoteDownloadList":
#                 "https://{platform}.{npEnvironment}.playstation.net/api/rdl"
#             },
#             ErrorParser: n
#           };
#           return t.register(f), f;
#         }),
#         "object" == typeof e && void 0 !== m
#           ? (m.exports = n(r(d[0]), r(d[1])))
#           : "function" == typeof define && define.amd
#           ? define([
#               "@sie/nimbus-core",
#               "@sie-private/nimbus-standard-error-parser"
#             ], n)
#           : ((t.Nimbus = t.Nimbus || {}),
#             (t.Nimbus.remoteDownloadList = n(
#               t.Nimbus,
#               t.Nimbus.StandardErrorParser
#             )));
#     },
#     1774,
#     [606, 1480]
#   );