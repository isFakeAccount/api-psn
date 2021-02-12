__d(
  function (g, r, i, a, m, e, d) {
    var o, u;
    (o = this),
      (u = function (o, u, s) {
        "use strict";
        (o = "default" in o ? o.default : o),
          (u = "default" in u ? u.default : u);
        var n =
            Object.assign ||
            function (o) {
              for (var u = 1; u < arguments.length; u++) {
                var s = arguments[u];
                for (var n in s)
                  Object.prototype.hasOwnProperty.call(s, n) && (o[n] = s[n]);
              }
              return o;
            },
          p = "psn:accessToken:std",
          t = "acceptLanguage",
          y = "std:gamingLoungeGroups";
        var h = {
          name: "gamingLoungeGroups",
          templates: Object.freeze({
            createGroup: function (o, u) {
              var h = o || {},
                v = h.queryParams,
                P = void 0 === v ? {} : v,
                T = h.headers,
                l = h.body;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "POST",
                endpoint: "/v1/groups",
                urlParams: {},
                body: l,
                queryParams: P,
                headers: n(
                  { "Content-Type": "application/json" },
                  s.addCommonHeader(u, T)
                )
              };
            },
            getGroupList: function (o, u) {
              var n = o || {},
                h = n.queryParams,
                v = void 0 === h ? {} : h,
                P = n.headers;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "GET",
                endpoint: "/v1/members/me/groups",
                urlParams: {},
                queryParams: v,
                headers: s.addCommonHeader(u, P)
              };
            },
            deleteMyAllGroupsNewArrival: function (o, u) {
              var n = o || {},
                h = n.queryParams,
                v = void 0 === h ? {} : h,
                P = n.headers;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "DELETE",
                endpoint: "/v1/members/me/groups/newArrival",
                urlParams: {},
                queryParams: v,
                headers: s.addCommonHeader(u, P)
              };
            },
            deleteMyGroupNewArrival: function (o, u) {
              var n = o || {},
                h = n.groupId,
                v = n.queryParams,
                P = void 0 === v ? {} : v,
                T = n.headers;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "DELETE",
                endpoint: "/v1/members/me/groups/{groupId}/newArrival",
                urlParams: { groupId: h },
                queryParams: P,
                headers: s.addCommonHeader(u, T)
              };
            },
            getGroupDetail: function (o, u) {
              var n = o || {},
                h = n.groupId,
                v = n.queryParams,
                P = void 0 === v ? {} : v,
                T = n.headers;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "GET",
                endpoint: "/v1/members/me/groups/{groupId}",
                urlParams: { groupId: h },
                queryParams: P,
                headers: s.addCommonHeader(u, T)
              };
            },
            updateMyGroup: function (o, u) {
              var h = o || {},
                v = h.groupId,
                P = h.queryParams,
                T = void 0 === P ? {} : P,
                l = h.headers,
                I = h.body;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "PATCH",
                endpoint: "/v1/members/me/groups/{groupId}",
                urlParams: { groupId: v },
                body: I,
                queryParams: T,
                headers: n(
                  { "Content-Type": "application/json" },
                  s.addCommonHeader(u, l)
                )
              };
            },
            updateGroup: function (o, u) {
              var h = o || {},
                v = h.groupId,
                P = h.queryParams,
                T = void 0 === P ? {} : P,
                l = h.headers,
                I = h.body;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "PATCH",
                endpoint: "/v1/groups/{groupId}",
                urlParams: { groupId: v },
                body: I,
                queryParams: T,
                headers: n(
                  { "Content-Type": "application/json" },
                  s.addCommonHeader(u, l)
                )
              };
            },
            inviteMembers: function (o, u) {
              var h = o || {},
                v = h.groupId,
                P = h.queryParams,
                T = void 0 === P ? {} : P,
                l = h.headers,
                I = h.body;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "POST",
                endpoint: "/v1/groups/{groupId}/invitees",
                urlParams: { groupId: v },
                body: I,
                queryParams: T,
                headers: n(
                  { "Content-Type": "application/json" },
                  s.addCommonHeader(u, l)
                )
              };
            },
            leaveGroup: function (o, u) {
              var n = o || {},
                h = n.groupId,
                v = n.queryParams,
                P = void 0 === v ? {} : v,
                T = n.headers;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "DELETE",
                endpoint: "/v1/groups/{groupId}/members/me",
                urlParams: { groupId: h },
                queryParams: P,
                headers: s.addCommonHeader(u, T)
              };
            },
            postMessage: function (o, u) {
              var h = o || {},
                v = h.groupId,
                P = h.threadId,
                T = h.queryParams,
                l = void 0 === T ? {} : T,
                I = h.headers,
                c = h.body;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "POST",
                endpoint: "/v1/groups/{groupId}/threads/{threadId}/messages",
                urlParams: { groupId: v, threadId: P },
                body: c,
                queryParams: l,
                headers: n(
                  { "Content-Type": "application/json" },
                  s.addCommonHeader(u, I)
                )
              };
            },
            getMessages: function (o, u) {
              var n = o || {},
                h = n.groupId,
                v = n.threadId,
                P = n.queryParams,
                T = void 0 === P ? {} : P,
                l = n.headers;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "GET",
                endpoint:
                  "/v1/members/me/groups/{groupId}/threads/{threadId}/messages",
                urlParams: { groupId: h, threadId: v },
                queryParams: T,
                headers: s.addCommonHeader(u, l)
              };
            },
            getMessage: function (o, u) {
              var n = o || {},
                h = n.groupId,
                v = n.threadId,
                P = n.messageUid,
                T = n.queryParams,
                l = void 0 === T ? {} : T,
                I = n.headers;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "GET",
                endpoint:
                  "/v1/members/me/groups/{groupId}/threads/{threadId}/messages/{messageUid}",
                urlParams: { groupId: h, threadId: v, messageUid: P },
                queryParams: l,
                headers: s.addCommonHeader(u, I)
              };
            },
            deleteMessage: function (o, u) {
              var n = o || {},
                h = n.groupId,
                v = n.threadId,
                P = n.messageUid,
                T = n.queryParams,
                l = void 0 === T ? {} : T,
                I = n.headers;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "DELETE",
                endpoint:
                  "/v1/members/me/groups/{groupId}/threads/{threadId}/messages/{messageUid}",
                urlParams: { groupId: h, threadId: v, messageUid: P },
                queryParams: l,
                headers: s.addCommonHeader(u, I)
              };
            },
            searchGroups: function (o, u) {
              var h = o || {},
                v = h.queryParams,
                P = void 0 === v ? {} : v,
                T = h.headers,
                l = h.body;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "POST",
                endpoint: "/v1/groups/search",
                urlParams: {},
                body: l,
                queryParams: P,
                headers: n(
                  { "Content-Type": "application/json" },
                  s.addCommonHeader(u, T)
                )
              };
            },
            updateThreadIgnore: function (o, u) {
              var h = o || {},
                v = h.groupId,
                P = h.threadId,
                T = h.queryParams,
                l = void 0 === T ? {} : T,
                I = h.headers,
                c = h.body;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "PATCH",
                endpoint: "/v1/members/me/groups/{groupId}/thread/{threadId}",
                urlParams: { groupId: v, threadId: P },
                body: c,
                queryParams: l,
                headers: n(
                  { "Content-Type": "application/json" },
                  s.addCommonHeader(u, I)
                )
              };
            },
            updateThread: function (o, u) {
              var h = o || {},
                v = h.groupId,
                P = h.threadId,
                T = h.queryParams,
                l = void 0 === T ? {} : T,
                I = h.headers,
                c = h.body;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "PATCH",
                endpoint: "/v1/members/me/groups/{groupId}/threads/{threadId}",
                urlParams: { groupId: v, threadId: P },
                body: c,
                queryParams: l,
                headers: n(
                  { "Content-Type": "application/json" },
                  s.addCommonHeader(u, I)
                )
              };
            },
            createAndJoinPartySession: function (o, u) {
              var h = o || {},
                v = h.groupId,
                P = h.queryParams,
                T = void 0 === P ? {} : P,
                l = h.headers,
                I = h.body;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "POST",
                endpoint: "/v1/groups/{groupId}/partySessions",
                urlParams: { groupId: v },
                body: I,
                queryParams: T,
                headers: n(
                  { "Content-Type": "application/json" },
                  s.addCommonHeader(u, l)
                )
              };
            },
            leavePartySession: function (o, u) {
              var n = o || {},
                h = n.sessionId,
                v = n.queryParams,
                P = void 0 === v ? {} : v,
                T = n.headers;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "DELETE",
                endpoint: "/v1/partySessions/{sessionId}/members/me",
                urlParams: { sessionId: h },
                queryParams: P,
                headers: s.addCommonHeader(u, T)
              };
            },
            replaceGroupIcon: function (o, u) {
              var h = o || {},
                v = h.groupId,
                P = h.queryParams,
                T = void 0 === P ? {} : P,
                l = h.headers,
                I = h.body;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "PUT",
                endpoint: "/v1/groups/{groupId}/icon",
                urlParams: { groupId: v },
                body: I,
                queryParams: T,
                headers: n(
                  { "Content-Type": "image/jpeg" },
                  s.addCommonHeader(u, l)
                )
              };
            },
            deleteGroupIcon: function (o, u) {
              var n = o || {},
                h = n.groupId,
                v = n.queryParams,
                P = void 0 === v ? {} : v,
                T = n.headers;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "DELETE",
                endpoint: "/v1/groups/{groupId}/icon",
                urlParams: { groupId: h },
                queryParams: P,
                headers: s.addCommonHeader(u, T)
              };
            },
            postResource: function (o, u) {
              var h = o || {},
                v = h.groupId,
                P = h.queryParams,
                T = void 0 === P ? {} : P,
                l = h.headers,
                I = h.body;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "POST",
                endpoint: "/v1/groups/{groupId}/resources",
                urlParams: { groupId: v },
                body: I,
                queryParams: T,
                headers: n(
                  { "Content-Type": "image/jpeg" },
                  s.addCommonHeader(u, l)
                )
              };
            },
            getResource: function (o, u) {
              var n = o || {},
                h = n.groupId,
                v = n.resourceId,
                P = n.queryParams,
                T = void 0 === P ? {} : P,
                l = n.headers;
              return {
                authType: p,
                apiGroup: y,
                languageType: t,
                method: "GET",
                endpoint: "/v1/groups/{groupId}/resources/{resourceId}",
                urlParams: { groupId: h, resourceId: v },
                queryParams: T,
                headers: s.addCommonHeader(u, l)
              };
            }
          }),
          defaultBaseUrls: {
            "std:gamingLoungeGroups":
              "https://{platform}.{npEnvironment}.playstation.net/api/gamingLoungeGroups"
          },
          ErrorParser: u
        };
        return o.register(h), h;
      }),
      "object" == typeof e && void 0 !== m
        ? (m.exports = u(r(d[0]), r(d[1]), r(d[2])))
        : "function" == typeof define && define.amd
        ? define([
            "@sie/nimbus-core",
            "@sie-private/nimbus-standard-error-parser",
            "@sie-private/nimbus-common-header"
          ], u)
        : ((o.Nimbus = o.Nimbus || {}),
          (o.Nimbus.gamingLoungeGroups = u(
            o.Nimbus,
            o.Nimbus.StandardErrorParser,
            o.Nimbus.CommonHeader
          )));
  },
  2893,
  [606, 1480, 1481]
);