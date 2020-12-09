
__d(
  function (g, r, i, a, m, e, d) {
    var o, n;
    (o = this),
      (n = function (o, n, t) {
        "use strict";
        (o = "default" in o ? o.default : o),
          (n = "default" in n ? n.default : n);
        var u =
            Object.assign ||
            function (o) {
              for (var n = 1; n < arguments.length; n++) {
                var t = arguments[n];
                for (var u in t)
                  Object.prototype.hasOwnProperty.call(t, u) && (o[u] = t[u]);
              }
              return o;
            },
          p = "psn:accessToken:std",
          s = "acceptLanguage",
          c = "std:trophy";
        var y = {
          name: "trophy",
          templates: Object.freeze({
            getTrophySummary: function (o, n) {
              var u = o || {},
                y = u.accountId,
                h = u.queryParams,
                I = void 0 === h ? {} : h,
                T = u.headers;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "GET",
                endpoint: "/v1/users/{accountId}/trophySummary",
                urlParams: { accountId: y },
                queryParams: I,
                headers: t.addCommonHeader(n, T)
              };
            },
            listTrophyTitles: function (o, n) {
              var u = o || {},
                y = u.accountId,
                h = u.queryParams,
                I = void 0 === h ? {} : h,
                T = u.headers;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "GET",
                endpoint: "/v1/users/{accountId}/trophyTitles",
                urlParams: { accountId: y },
                queryParams: I,
                headers: t.addCommonHeader(n, T)
              };
            },
            deleteTrophies: function (o, n) {
              var u = o || {},
                y = u.accountId,
                h = u.queryParams,
                I = void 0 === h ? {} : h,
                T = u.headers;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "DELETE",
                endpoint: "/v1/users/{accountId}/trophyTitles",
                urlParams: { accountId: y },
                queryParams: I,
                headers: t.addCommonHeader(n, T)
              };
            },
            listTitlesTrophyTitles: function (o, n) {
              var u = o || {},
                y = u.accountId,
                h = u.queryParams,
                I = void 0 === h ? {} : h,
                T = u.headers;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "GET",
                endpoint: "/v1/users/{accountId}/titles/trophyTitles",
                urlParams: { accountId: y },
                queryParams: I,
                headers: t.addCommonHeader(n, T)
              };
            },
            deleteTrophyTitle: function (o, n) {
              var u = o || {},
                y = u.accountId,
                h = u.npCommunicationId,
                I = u.queryParams,
                T = void 0 === I ? {} : I,
                l = u.headers;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "DELETE",
                endpoint:
                  "/v1/users/{accountId}/npCommunicationIds/{npCommunicationId}",
                urlParams: { accountId: y, npCommunicationId: h },
                queryParams: T,
                headers: t.addCommonHeader(n, l)
              };
            },
            listTrophyGroupDefinitions: function (o, n) {
              var u = o || {},
                y = u.npCommunicationId,
                h = u.queryParams,
                I = void 0 === h ? {} : h,
                T = u.headers;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "GET",
                endpoint:
                  "/v1/npCommunicationIds/{npCommunicationId}/trophyGroups",
                urlParams: { npCommunicationId: y },
                queryParams: I,
                headers: t.addCommonHeader(n, T)
              };
            },
            listTrophyGroups: function (o, n) {
              var u = o || {},
                y = u.accountId,
                h = u.npCommunicationId,
                I = u.queryParams,
                T = void 0 === I ? {} : I,
                l = u.headers;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "GET",
                endpoint:
                  "/v1/users/{accountId}/npCommunicationIds/{npCommunicationId}/trophyGroups",
                urlParams: { accountId: y, npCommunicationId: h },
                queryParams: T,
                headers: t.addCommonHeader(n, l)
              };
            },
            listTrophyDefinitions: function (o, n) {
              var u = o || {},
                y = u.npCommunicationId,
                h = u.trophyGroupId,
                I = u.queryParams,
                T = void 0 === I ? {} : I,
                l = u.headers;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "GET",
                endpoint:
                  "/v1/npCommunicationIds/{npCommunicationId}/trophyGroups/{trophyGroupId}/trophies",
                urlParams: { npCommunicationId: y, trophyGroupId: h },
                queryParams: T,
                headers: t.addCommonHeader(n, l)
              };
            },
            listTrophies: function (o, n) {
              var u = o || {},
                y = u.accountId,
                h = u.npCommunicationId,
                I = u.queryParams,
                T = void 0 === I ? {} : I,
                l = u.headers;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "GET",
                endpoint:
                  "/v1/users/{accountId}/npCommunicationIds/{npCommunicationId}/trophies",
                urlParams: { accountId: y, npCommunicationId: h },
                queryParams: T,
                headers: t.addCommonHeader(n, l)
              };
            },
            patchUnlockedTrophies: function (o, n) {
              var y = o || {},
                h = y.accountId,
                I = y.npCommunicationId,
                T = y.queryParams,
                l = void 0 === T ? {} : T,
                v = y.headers,
                C = y.body;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "PATCH",
                endpoint:
                  "/v1/users/{accountId}/npCommunicationIds/{npCommunicationId}/trophies/unlock",
                urlParams: { accountId: h, npCommunicationId: I },
                body: C,
                queryParams: l,
                headers: u(
                  { "Content-Type": "application/json" },
                  t.addCommonHeader(n, v)
                )
              };
            },
            patchProgressedTrophies: function (o, n) {
              var y = o || {},
                h = y.accountId,
                I = y.npCommunicationId,
                T = y.queryParams,
                l = void 0 === T ? {} : T,
                v = y.headers,
                C = y.body;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "PATCH",
                endpoint:
                  "/v1/users/{accountId}/npCommunicationIds/{npCommunicationId}/trophies/progress",
                urlParams: { accountId: h, npCommunicationId: I },
                body: C,
                queryParams: l,
                headers: u(
                  { "Content-Type": "application/json" },
                  t.addCommonHeader(n, v)
                )
              };
            },
            listTrophiesPerTrophyGroup: function (o, n) {
              var u = o || {},
                y = u.accountId,
                h = u.npCommunicationId,
                I = u.trophyGroupId,
                T = u.queryParams,
                l = void 0 === T ? {} : T,
                v = u.headers;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "GET",
                endpoint:
                  "/v1/users/{accountId}/npCommunicationIds/{npCommunicationId}/trophyGroups/{trophyGroupId}/trophies",
                urlParams: {
                  accountId: y,
                  npCommunicationId: h,
                  trophyGroupId: I
                },
                queryParams: l,
                headers: t.addCommonHeader(n, v)
              };
            },
            getTrophyDefinition: function (o, n) {
              var u = o || {},
                y = u.npCommunicationId,
                h = u.trophyId,
                I = u.queryParams,
                T = void 0 === I ? {} : I,
                l = u.headers;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "GET",
                endpoint:
                  "/v1/npCommunicationIds/{npCommunicationId}/trophies/{trophyId}",
                urlParams: { npCommunicationId: y, trophyId: h },
                queryParams: T,
                headers: t.addCommonHeader(n, l)
              };
            },
            getTrophy: function (o, n) {
              var u = o || {},
                y = u.accountId,
                h = u.npCommunicationId,
                I = u.trophyId,
                T = u.queryParams,
                l = void 0 === T ? {} : T,
                v = u.headers;
                // NOTE: TROOOOOOPHIES
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "GET",
                endpoint:
                  "/v1/users/{accountId}/npCommunicationIds/{npCommunicationId}/trophies/{trophyId}",
                urlParams: { accountId: y, npCommunicationId: h, trophyId: I },
                queryParams: l,
                headers: t.addCommonHeader(n, v)
              };
            },
            getPrivacySetting: function (o, n) {
              var u = o || {},
                y = u.accountId,
                h = u.queryParams,
                I = void 0 === h ? {} : h,
                T = u.headers;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "GET",
                endpoint: "/v1/users/{accountId}/privacySetting",
                urlParams: { accountId: y },
                queryParams: I,
                headers: t.addCommonHeader(n, T)
              };
            },
            putPrivacySetting: function (o, n) {
              var y = o || {},
                h = y.accountId,
                I = y.queryParams,
                T = void 0 === I ? {} : I,
                l = y.headers,
                v = y.body;
              return {
                authType: p,
                apiGroup: c,
                languageType: s,
                method: "PUT",
                endpoint: "/v1/users/{accountId}/privacySetting",
                urlParams: { accountId: h },
                body: v,
                queryParams: T,
                headers: u(
                  { "Content-Type": "application/json" },
                  t.addCommonHeader(n, l)
                )
              };
            }
          }),
          defaultBaseUrls: {
            "std:trophy":
              "https://{platform}.{npEnvironment}.playstation.net/api/trophy"
          },
          ErrorParser: n
        };
        return o.register(y), y;
      }),
      "object" == typeof e && void 0 !== m
        ? (m.exports = n(r(d[0]), r(d[1]), r(d[2])))
        : "function" == typeof define && define.amd
        ? define([
            "@sie/nimbus-core",
            "@sie-private/nimbus-standard-error-parser",
            "@sie-private/nimbus-common-header"
          ], n)
        : ((o.Nimbus = o.Nimbus || {}),
          (o.Nimbus.trophy = n(
            o.Nimbus,
            o.Nimbus.StandardErrorParser,
            o.Nimbus.CommonHeader
          )));
  },
  1864,
  [606, 1480, 1481]
);