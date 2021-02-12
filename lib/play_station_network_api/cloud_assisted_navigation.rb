# __d(
#     function (g, r, i, a, m, e, d) {
#       var n, t;
#       (n = this),
#         (t = function (n, t, o) {
#           "use strict";
#           (n = "default" in n ? n.default : n),
#             (t = "default" in t ? t.default : t);
#           var s =
#               Object.assign ||
#               function (n) {
#                 for (var t = 1; t < arguments.length; t++) {
#                   var o = arguments[t];
#                   for (var s in o)
#                     Object.prototype.hasOwnProperty.call(o, s) && (n[s] = o[s]);
#                 }
#                 return n;
#               },
#             u = "psn:accessToken:std",
#             p = "acceptLanguage",
#             c = "std:cloudAssistedNavigation";
#           var y = {
#             name: "cloudAssistedNavigation",
#             templates: Object.freeze({
#               getActionList: function (n, t) {
#                 var s = n || {},
#                   y = s.queryParams,
#                   l = void 0 === y ? {} : y,
#                   v = s.headers;
#                 return {
#                   authType: u,
#                   apiGroup: c,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/users/me/actions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(t, v)
#                 };
#               },
#               updateActionStates: function (n, t) {
#                 var y = n || {},
#                   l = y.queryParams,
#                   v = void 0 === l ? {} : l,
#                   h = y.headers,
#                   P = y.body;
#                 return {
#                   authType: u,
#                   apiGroup: c,
#                   languageType: p,
#                   method: "PUT",
#                   endpoint: "/v1/users/me/actions",
#                   urlParams: {},
#                   body: P,
#                   queryParams: v,
#                   headers: s(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(t, h)
#                   )
#                 };
#               },
#               getCommandList: function (n, t) {
#                 var s = n || {},
#                   y = s.queryParams,
#                   l = void 0 === y ? {} : y,
#                   v = s.headers;
#                 return {
#                   authType: u,
#                   apiGroup: c,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/users/me/commands",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(t, v)
#                 };
#               },
#               postCommand: function (n, t) {
#                 var y = n || {},
#                   l = y.queryParams,
#                   v = void 0 === l ? {} : l,
#                   h = y.headers,
#                   P = y.body;
#                 return {
#                   authType: u,
#                   apiGroup: c,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/users/me/commands",
#                   urlParams: {},
#                   body: P,
#                   queryParams: v,
#                   headers: s(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(t, h)
#                   )
#                 };
#               },
#               deleteCommand: function (n, t) {
#                 var s = n || {},
#                   y = s.queryParams,
#                   l = void 0 === y ? {} : y,
#                   v = s.headers;
#                 return {
#                   authType: u,
#                   apiGroup: c,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/users/me/commands",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(t, v)
#                 };
#               },
#               updateActionState: function (n, t) {
#                 var y = n || {},
#                   l = y.commandId,
#                   v = y.actionId,
#                   h = y.queryParams,
#                   P = void 0 === h ? {} : h,
#                   T = y.headers,
#                   f = y.body;
#                 return {
#                   authType: u,
#                   apiGroup: c,
#                   languageType: p,
#                   method: "PUT",
#                   endpoint:
#                     "/v1/users/me/commands/{commandId}/actions/{actionId}",
#                   urlParams: { commandId: l, actionId: v },
#                   body: f,
#                   queryParams: P,
#                   headers: s(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(t, T)
#                   )
#                 };
#               },
#               getClientList: function (n, t) {
#                 var s = n || {},
#                   y = s.queryParams,
#                   l = void 0 === y ? {} : y,
#                   v = s.headers;
#                 return {
#                   authType: u,
#                   apiGroup: c,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/users/me/clients",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(t, v)
#                 };
#               },
#               deleteClient: function (n, t) {
#                 var s = n || {},
#                   y = s.queryParams,
#                   l = void 0 === y ? {} : y,
#                   v = s.headers;
#                 return {
#                   authType: u,
#                   apiGroup: c,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/users/me/clients",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(t, v)
#                 };
#               },
#               updateClient: function (n, t) {
#                 var y = n || {},
#                   l = y.queryParams,
#                   v = void 0 === l ? {} : l,
#                   h = y.headers,
#                   P = y.body;
#                 return {
#                   authType: u,
#                   apiGroup: c,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint: "/v1/users/me/clients",
#                   urlParams: {},
#                   body: P,
#                   queryParams: v,
#                   headers: s(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(t, h)
#                   )
#                 };
#               }
#             }),
#             defaultBaseUrls: {
#               "std:cloudAssistedNavigation":
#                 "https://{platform}.{npEnvironment}.playstation.net/api/cloudAssistedNavigation"
#             },
#             ErrorParser: t
#           };
#           return n.register(y), y;
#         }),
#         "object" == typeof e && void 0 !== m
#           ? (m.exports = t(r(d[0]), r(d[1]), r(d[2])))
#           : "function" == typeof define && define.amd
#           ? define([
#               "@sie/nimbus-core",
#               "@sie-private/nimbus-standard-error-parser",
#               "@sie-private/nimbus-common-header"
#             ], t)
#           : ((n.Nimbus = n.Nimbus || {}),
#             (n.Nimbus.cloudAssistedNavigation = t(
#               n.Nimbus,
#               n.Nimbus.StandardErrorParser,
#               n.Nimbus.CommonHeader
#             )));
#     },
#     1773,
#     [606, 1480, 1481]
#   );