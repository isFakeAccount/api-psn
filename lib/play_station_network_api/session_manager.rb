
# __d(
#     function (g, r, i, a, m, e, d) {
#       var s, n;
#       (s = this),
#         (n = function (s, n, o) {
#           "use strict";
#           (s = "default" in s ? s.default : s),
#             (n = "default" in n ? n.default : n);
#           var t =
#               Object.assign ||
#               function (s) {
#                 for (var n = 1; n < arguments.length; n++) {
#                   var o = arguments[n];
#                   for (var t in o)
#                     Object.prototype.hasOwnProperty.call(o, t) && (s[t] = o[t]);
#                 }
#                 return s;
#               },
#             u = "psn:accessToken:std",
#             p = "acceptLanguage",
#             y = "std:sessionManager";
#           var h = {
#             name: "sessionManager",
#             templates: Object.freeze({
#               getCrossGenSessionInvitationSession: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/crossGen/sessionInvitation/sessions/{sessionId}",
#                   urlParams: { sessionId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               getCrossGenSessionInvitationUsersInvitations: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/crossGen/sessionInvitation/users/me/invitations",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               deleteCrossGenSessionInvitationUsersInvitations: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/crossGen/sessionInvitation/users/me/invitations",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               getCrossGenSessionInvitationUsersInvitation: function (s, n) {
#                 var t = s || {},
#                   h = t.invitationId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint:
#                     "/v1/crossGen/sessionInvitation/users/me/invitations/{invitationId}",
#                   urlParams: { invitationId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               putCrossGenSessionInvitationUsersInvitation: function (s, n) {
#                 var h = s || {},
#                   l = h.invitationId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PUT",
#                   endpoint:
#                     "/v1/crossGen/sessionInvitation/users/me/invitations/{invitationId}",
#                   urlParams: { invitationId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               getInternalPlayerSessions: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/internal/playerSessions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               internalCreatePlayerSessions: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/internal/playerSessions",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               internalDeletePlayerSession: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/internal/playerSessions/{sessionId}",
#                   urlParams: { sessionId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               internalLeavePlayerSession: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.accountId,
#                   c = t.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint:
#                     "/v1/internal/playerSessions/{sessionId}/members/{accountId}",
#                   urlParams: { sessionId: h, accountId: l },
#                   queryParams: P,
#                   headers: o.addCommonHeader(n, v)
#                 };
#               },
#               internalJoinPlayerSessionAsPlayer: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint:
#                     "/v1/internal/playerSessions/{sessionId}/member/players",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               internalJoinPlayerSessionAsSpectator: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint:
#                     "/v1/internal/playerSessions/{sessionId}/member/spectators",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               getInternalGameSessions: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/internal/gameSessions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               internalCreateGameSessions: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/internal/gameSessions",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               internalLeaveGameSession: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.accountId,
#                   c = t.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint:
#                     "/v1/internal/gameSessions/{sessionId}/members/{accountId}",
#                   urlParams: { sessionId: h, accountId: l },
#                   queryParams: P,
#                   headers: o.addCommonHeader(n, v)
#                 };
#               },
#               internalJoinGameSessionAsPlayer: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint:
#                     "/v1/internal/gameSessions/{sessionId}/member/players",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               internalJoinGameSessionAsSpectator: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint:
#                     "/v1/internal/gameSessions/{sessionId}/member/spectators",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               leaveAllSessions: function (s, n) {
#                 var t = s || {},
#                   h = t.accountId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/internal/users/{accountId}/sessions",
#                   urlParams: { accountId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               getInternalJoinedPartySessionsByUser: function (s, n) {
#                 var t = s || {},
#                   h = t.accountId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/internal/users/{accountId}/partySessions",
#                   urlParams: { accountId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               deleteUsersAccountIdPartySessions: function (s, n) {
#                 var t = s || {},
#                   h = t.accountId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/internal/users/{accountId}/partySessions",
#                   urlParams: { accountId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               getInternalPlayerSessionsInvitations: function (s, n) {
#                 var t = s || {},
#                   h = t.accountId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint:
#                     "/v1/internal/users/{accountId}/playerSessionsInvitations",
#                   urlParams: { accountId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               deleteInternalUsersPlayerSessionsInvitation: function (s, n) {
#                 var t = s || {},
#                   h = t.accountId,
#                   l = t.invitationId,
#                   c = t.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint:
#                     "/v1/internal/users/{accountId}/playerSessionsInvitations/{invitationId}",
#                   urlParams: { accountId: h, invitationId: l },
#                   queryParams: P,
#                   headers: o.addCommonHeader(n, v)
#                 };
#               },
#               patchInternalUsersPlayerSessionsInvitation: function (s, n) {
#                 var h = s || {},
#                   l = h.accountId,
#                   c = h.invitationId,
#                   P = h.queryParams,
#                   v = void 0 === P ? {} : P,
#                   I = h.headers,
#                   T = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint:
#                     "/v1/internal/users/{accountId}/playerSessionsInvitations/{invitationId}",
#                   urlParams: { accountId: l, invitationId: c },
#                   body: T,
#                   queryParams: v,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, I)
#                   )
#                 };
#               },
#               createGameSessionsForMatchmaking: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/internal/gameSessionsForMatchmaking",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               getInternalPartySessions: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/internal/partySessions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               createInternalPartySessions: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/internal/partySessions",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               deleteInternalPartySession: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/internal/partySessions/{sessionId}",
#                   urlParams: { sessionId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               joinInternalPartySession: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/internal/partySessions/{sessionId}/members",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               leaveInternalPartySession: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.accountId,
#                   c = t.platform,
#                   P = t.queryParams,
#                   v = void 0 === P ? {} : P,
#                   I = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint:
#                     "/v1/internal/partySessions/{sessionId}/members/{accountId}.{platform}",
#                   urlParams: { sessionId: h, accountId: l, platform: c },
#                   queryParams: v,
#                   headers: o.addCommonHeader(n, I)
#                 };
#               },
#               postInternalUsersPresenceNotifications: function (s, n) {
#                 var h = s || {},
#                   l = h.accountId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint:
#                     "/v1/internal/users/{accountId}/presenceNotifications",
#                   urlParams: { accountId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               getResourcePlayerSessions: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/resource/playerSessions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               getResourceJoinedPlayerSessionsByUser: function (s, n) {
#                 var t = s || {},
#                   h = t.accountId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/resource/users/{accountId}/playerSessions",
#                   urlParams: { accountId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               postResourcePlayerSession: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/resource/playerSession",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               patchResourceUsersPlayerSessionsInvitation: function (s, n) {
#                 var h = s || {},
#                   l = h.accountId,
#                   c = h.invitationId,
#                   P = h.queryParams,
#                   v = void 0 === P ? {} : P,
#                   I = h.headers,
#                   T = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint:
#                     "/v1/resource/users/{accountId}/playerSessionsInvitations/{invitationId}",
#                   urlParams: { accountId: l, invitationId: c },
#                   body: T,
#                   queryParams: v,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, I)
#                   )
#                 };
#               },
#               postResourceGameSession: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/resource/gameSession",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               getResourceGameSessions: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/resource/gameSessions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               getResourceJoinedGameSessionsByUser: function (s, n) {
#                 var t = s || {},
#                   h = t.accountId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/resource/users/{accountId}/gameSessions",
#                   urlParams: { accountId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               deleteResourceGameSession: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/resource/gameSessions/{sessionId}",
#                   urlParams: { sessionId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               leaveResourceGameSession: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.accountId,
#                   c = t.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint:
#                     "/v1/resource/gameSessions/{sessionId}/members/{accountId}",
#                   urlParams: { sessionId: h, accountId: l },
#                   queryParams: P,
#                   headers: o.addCommonHeader(n, v)
#                 };
#               },
#               getSessionsSignalingSessions: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/sessions/signalingSessions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               postSessionsSignalingSessions: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/sessions/signalingSessions",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               deleteSessionsSignalingSessions: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/sessions/signalingSessions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               postSessionsSignalingSessionsBinaryMessages: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint:
#                     "/v1/sessions/signalingSessions/{sessionId}/binaryMessages",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               deleteSessionsSignalingSessionsMembers: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/sessions/signalingSessions/{sessionId}/members",
#                   urlParams: { sessionId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               getSessionsPartySessions: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/sessions/partySessions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               postSessionsPartySessions: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/sessions/partySessions",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               deleteSessionsPartySessions: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/sessions/partySessions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               patchSessionsPartySessions: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint: "/v1/sessions/partySessions",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               getSessionsPartySessionsBridge: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/sessions/partySessions/{sessionId}/bridge",
#                   urlParams: { sessionId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               putSessionsPartySessionsBridge: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PUT",
#                   endpoint: "/v1/sessions/partySessions/{sessionId}/bridge",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               deleteSessionsPartySessionsBridge: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/sessions/partySessions/{sessionId}/bridge",
#                   urlParams: { sessionId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               postSessionsPartySessionsBinaryMessages: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint:
#                     "/v1/sessions/partySessions/{sessionId}/binaryMessages",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               postSessionsPartySessionsMembers: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/sessions/partySessions/{sessionId}/members",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               deleteSessionsPartySessionsMembers: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/sessions/partySessions/{sessionId}/members",
#                   urlParams: { sessionId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               createSysPlayerSessionsForAsyncBootToGroup: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/sys/playerSessionsForAsyncBootToGroup",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               getPlayerSessions: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/playerSessions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               createPlayerSessions: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/playerSessions",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               setPlayerSessionProperties: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint: "/v1/playerSessions/{sessionId}",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               changePlayerSessionLeader: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PUT",
#                   endpoint: "/v1/playerSessions/{sessionId}/leader",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               addPlayerSessionJoinableSpecifiedUsers: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint:
#                     "/v1/playerSessions/{sessionId}/joinableSpecifiedUsers",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               deletePlayerSessionJoinableSpecifiedUsers: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint:
#                     "/v1/playerSessions/{sessionId}/joinableSpecifiedUsers",
#                   urlParams: { sessionId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               leavePlayerSession: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.accountId,
#                   c = t.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/playerSessions/{sessionId}/members/{accountId}",
#                   urlParams: { sessionId: h, accountId: l },
#                   queryParams: P,
#                   headers: o.addCommonHeader(n, v)
#                 };
#               },
#               setPlayerSessionMemberSystemProperties: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.accountId,
#                   P = h.queryParams,
#                   v = void 0 === P ? {} : P,
#                   I = h.headers,
#                   T = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint: "/v1/playerSessions/{sessionId}/members/{accountId}",
#                   urlParams: { sessionId: l, accountId: c },
#                   body: T,
#                   queryParams: v,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, I)
#                   )
#                 };
#               },
#               joinPlayerSessionAsPlayer: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/playerSessions/{sessionId}/member/players",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               joinPlayerSessionAsSpectator: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/playerSessions/{sessionId}/member/spectators",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               setPlayerSessionMemberPushContexts: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint:
#                     "/v1/playerSessions/{sessionId}/member/me/pushContexts",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               sendPlayerSessionCustomMessage: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/playerSessions/{sessionId}/customMessage",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               sendPlayerSessionMessage: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/playerSessions/{sessionId}/sessionMessage",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               addPlayerSessionBridges: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/playerSessions/{sessionId}/bridges",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               deletePlayerSessionBridge: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.bridgeId,
#                   c = t.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/playerSessions/{sessionId}/bridges/{bridgeId}",
#                   urlParams: { sessionId: h, bridgeId: l },
#                   queryParams: P,
#                   headers: o.addCommonHeader(n, v)
#                 };
#               },
#               addPlayerSessionVoiceChatChannels: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/playerSessions/{sessionId}/voiceChatChannels",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               deletePlayerSessionVoiceChatChannel: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.voiceChatChannelId,
#                   c = t.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint:
#                     "/v1/playerSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}",
#                   urlParams: { sessionId: h, voiceChatChannelId: l },
#                   queryParams: P,
#                   headers: o.addCommonHeader(n, v)
#                 };
#               },
#               setPlayerSessionVoiceChatChannelProperties: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.voiceChatChannelId,
#                   P = h.queryParams,
#                   v = void 0 === P ? {} : P,
#                   I = h.headers,
#                   T = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint:
#                     "/v1/playerSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}",
#                   urlParams: { sessionId: l, voiceChatChannelId: c },
#                   body: T,
#                   queryParams: v,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, I)
#                   )
#                 };
#               },
#               joinPlayerSessionVoiceChatChannel: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.voiceChatChannelId,
#                   P = h.queryParams,
#                   v = void 0 === P ? {} : P,
#                   I = h.headers,
#                   T = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint:
#                     "/v1/playerSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}/members",
#                   urlParams: { sessionId: l, voiceChatChannelId: c },
#                   body: T,
#                   queryParams: v,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, I)
#                   )
#                 };
#               },
#               leavePlayerSessionVoiceChatChannel: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.voiceChatChannelId,
#                   c = t.accountId,
#                   P = t.platform,
#                   v = t.queryParams,
#                   I = void 0 === v ? {} : v,
#                   T = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint:
#                     "/v1/playerSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}/members/{accountId}.{platform}",
#                   urlParams: {
#                     sessionId: h,
#                     voiceChatChannelId: l,
#                     accountId: c,
#                     platform: P
#                   },
#                   queryParams: I,
#                   headers: o.addCommonHeader(n, T)
#                 };
#               },
#               setPlayerSessionVoiceChatChannelMembersSystemProperties: function (
#                 s,
#                 n
#               ) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.voiceChatChannelId,
#                   P = h.accountId,
#                   v = h.platform,
#                   I = h.queryParams,
#                   T = void 0 === I ? {} : I,
#                   C = h.headers,
#                   S = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint:
#                     "/v1/playerSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}/members/{accountId}.{platform}",
#                   urlParams: {
#                     sessionId: l,
#                     voiceChatChannelId: c,
#                     accountId: P,
#                     platform: v
#                   },
#                   body: S,
#                   queryParams: T,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, C)
#                   )
#                 };
#               },
#               getJoinedPlayerSessionsByUser: function (s, n) {
#                 var t = s || {},
#                   h = t.accountId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/users/{accountId}/playerSessions",
#                   urlParams: { accountId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               sendPlayerSessionInvitations: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/playerSessions/{sessionId}/invitations",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               getPlayerSessionInvitations: function (s, n) {
#                 var t = s || {},
#                   h = t.accountId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/users/{accountId}/playerSessionsInvitations",
#                   urlParams: { accountId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               patchUsersPlayerSessionsInvitation: function (s, n) {
#                 var h = s || {},
#                   l = h.accountId,
#                   c = h.invitationId,
#                   P = h.queryParams,
#                   v = void 0 === P ? {} : P,
#                   I = h.headers,
#                   T = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint:
#                     "/v1/users/{accountId}/playerSessionsInvitations/{invitationId}",
#                   urlParams: { accountId: l, invitationId: c },
#                   body: T,
#                   queryParams: v,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, I)
#                   )
#                 };
#               },
#               getGameSessions: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/gameSessions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               createGameSessions: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/gameSessions",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               deleteGameSession: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/gameSessions/{sessionId}",
#                   urlParams: { sessionId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               setGameSessionProperties: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint: "/v1/gameSessions/{sessionId}",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               leaveGameSession: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.accountId,
#                   c = t.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/gameSessions/{sessionId}/members/{accountId}",
#                   urlParams: { sessionId: h, accountId: l },
#                   queryParams: P,
#                   headers: o.addCommonHeader(n, v)
#                 };
#               },
#               setGameSessionMemberSystemProperties: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.accountId,
#                   P = h.queryParams,
#                   v = void 0 === P ? {} : P,
#                   I = h.headers,
#                   T = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint: "/v1/gameSessions/{sessionId}/members/{accountId}",
#                   urlParams: { sessionId: l, accountId: c },
#                   body: T,
#                   queryParams: v,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, I)
#                   )
#                 };
#               },
#               joinGameSessionAsPlayer: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/gameSessions/{sessionId}/member/players",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               joinGameSessionAsSpectator: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/gameSessions/{sessionId}/member/spectators",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               setGameSessionMemberPushContexts: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/gameSessions/{sessionId}/member/me/pushContexts",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               sendGameSessionCustomMessage: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/gameSessions/{sessionId}/customMessage",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               sendGameSessionMessage: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/gameSessions/{sessionId}/sessionMessage",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               addGameSessionBridges: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/gameSessions/{sessionId}/bridges",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               deleteGameSessionBridge: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.bridgeId,
#                   c = t.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/gameSessions/{sessionId}/bridges/{bridgeId}",
#                   urlParams: { sessionId: h, bridgeId: l },
#                   queryParams: P,
#                   headers: o.addCommonHeader(n, v)
#                 };
#               },
#               addGameSessionVoiceChatChannels: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/gameSessions/{sessionId}/voiceChatChannels",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               deleteGameSessionVoiceChatChannel: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.voiceChatChannelId,
#                   c = t.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint:
#                     "/v1/gameSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}",
#                   urlParams: { sessionId: h, voiceChatChannelId: l },
#                   queryParams: P,
#                   headers: o.addCommonHeader(n, v)
#                 };
#               },
#               setGameSessionVoiceChatChannelProperties: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.voiceChatChannelId,
#                   P = h.queryParams,
#                   v = void 0 === P ? {} : P,
#                   I = h.headers,
#                   T = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint:
#                     "/v1/gameSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}",
#                   urlParams: { sessionId: l, voiceChatChannelId: c },
#                   body: T,
#                   queryParams: v,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, I)
#                   )
#                 };
#               },
#               joinGameSessionVoiceChatChannel: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.voiceChatChannelId,
#                   P = h.queryParams,
#                   v = void 0 === P ? {} : P,
#                   I = h.headers,
#                   T = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint:
#                     "/v1/gameSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}/members",
#                   urlParams: { sessionId: l, voiceChatChannelId: c },
#                   body: T,
#                   queryParams: v,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, I)
#                   )
#                 };
#               },
#               leaveGameSessionVoiceChatChannel: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.voiceChatChannelId,
#                   c = t.accountId,
#                   P = t.platform,
#                   v = t.queryParams,
#                   I = void 0 === v ? {} : v,
#                   T = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint:
#                     "/v1/gameSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}/members/{accountId}.{platform}",
#                   urlParams: {
#                     sessionId: h,
#                     voiceChatChannelId: l,
#                     accountId: c,
#                     platform: P
#                   },
#                   queryParams: I,
#                   headers: o.addCommonHeader(n, T)
#                 };
#               },
#               setGameSessionVoiceChatChannelMembersSystemProperties: function (
#                 s,
#                 n
#               ) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.voiceChatChannelId,
#                   P = h.accountId,
#                   v = h.platform,
#                   I = h.queryParams,
#                   T = void 0 === I ? {} : I,
#                   C = h.headers,
#                   S = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint:
#                     "/v1/gameSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}/members/{accountId}.{platform}",
#                   urlParams: {
#                     sessionId: l,
#                     voiceChatChannelId: c,
#                     accountId: P,
#                     platform: v
#                   },
#                   body: S,
#                   queryParams: T,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, C)
#                   )
#                 };
#               },
#               addGameSessionVoiceChatGroups: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.voiceChatChannelId,
#                   c = t.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint:
#                     "/v1/gameSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}/voiceChatGroups",
#                   urlParams: { sessionId: h, voiceChatChannelId: l },
#                   queryParams: P,
#                   headers: o.addCommonHeader(n, v)
#                 };
#               },
#               deleteGameSessionsVoiceChatChannelsVoiceChatGroups: function (
#                 s,
#                 n
#               ) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.voiceChatChannelId,
#                   c = t.voiceChatGroupId,
#                   P = t.queryParams,
#                   v = void 0 === P ? {} : P,
#                   I = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint:
#                     "/v1/gameSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}/voiceChatGroups/{voiceChatGroupId}",
#                   urlParams: {
#                     sessionId: h,
#                     voiceChatChannelId: l,
#                     voiceChatGroupId: c
#                   },
#                   queryParams: v,
#                   headers: o.addCommonHeader(n, I)
#                 };
#               },
#               joinGameSessionVoiceChatGroup: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.voiceChatChannelId,
#                   P = h.voiceChatGroupId,
#                   v = h.queryParams,
#                   I = void 0 === v ? {} : v,
#                   T = h.headers,
#                   C = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint:
#                     "/v1/gameSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}/voiceChatGroups/{voiceChatGroupId}/members",
#                   urlParams: {
#                     sessionId: l,
#                     voiceChatChannelId: c,
#                     voiceChatGroupId: P
#                   },
#                   body: C,
#                   queryParams: I,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, T)
#                   )
#                 };
#               },
#               leaveGameSessionVoiceChatGroup: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.voiceChatChannelId,
#                   c = t.voiceChatGroupId,
#                   P = t.accountId,
#                   v = t.platform,
#                   I = t.queryParams,
#                   T = void 0 === I ? {} : I,
#                   C = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint:
#                     "/v1/gameSessions/{sessionId}/voiceChatChannels/{voiceChatChannelId}/voiceChatGroups/{voiceChatGroupId}/members/{accountId}.{platform}",
#                   urlParams: {
#                     sessionId: h,
#                     voiceChatChannelId: l,
#                     voiceChatGroupId: c,
#                     accountId: P,
#                     platform: v
#                   },
#                   queryParams: T,
#                   headers: o.addCommonHeader(n, C)
#                 };
#               },
#               getJoinedGameSessionsByUser: function (s, n) {
#                 var t = s || {},
#                   h = t.accountId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/users/{accountId}/gameSessions",
#                   urlParams: { accountId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               getPartySessions: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/partySessions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               setPartySessionProperties: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint: "/v1/partySessions/{sessionId}",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               setPartySessionMemberProperties: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.accountId,
#                   P = h.platform,
#                   v = h.queryParams,
#                   I = void 0 === v ? {} : v,
#                   T = h.headers,
#                   C = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint:
#                     "/v1/partySessions/{sessionId}/members/{accountId}.{platform}",
#                   urlParams: { sessionId: l, accountId: c, platform: P },
#                   body: C,
#                   queryParams: I,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, T)
#                   )
#                 };
#               },
#               sendPartySessionCustomMessage: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/partySessions/{sessionId}/customMessage",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               addPartySessionBridges: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/partySessions/{sessionId}/bridges",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               deletePartySessionBridge: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.bridgeId,
#                   c = t.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/partySessions/{sessionId}/bridges/{bridgeId}",
#                   urlParams: { sessionId: h, bridgeId: l },
#                   queryParams: P,
#                   headers: o.addCommonHeader(n, v)
#                 };
#               },
#               getRemotePlaySessions: function (s, n) {
#                 var t = s || {},
#                   h = t.queryParams,
#                   l = void 0 === h ? {} : h,
#                   c = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "GET",
#                   endpoint: "/v1/remotePlaySessions",
#                   urlParams: {},
#                   queryParams: l,
#                   headers: o.addCommonHeader(n, c)
#                 };
#               },
#               postRemotePlaySessions: function (s, n) {
#                 var h = s || {},
#                   l = h.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = h.headers,
#                   v = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/remotePlaySessions",
#                   urlParams: {},
#                   body: v,
#                   queryParams: c,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, P)
#                   )
#                 };
#               },
#               patchRemotePlaySession: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "PATCH",
#                   endpoint: "/v1/remotePlaySessions/{sessionId}",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               postRemotePlaySessionsMembers: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/remotePlaySessions/{sessionId}/members",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               },
#               deleteRemotePlaySessionsMembersMe: function (s, n) {
#                 var t = s || {},
#                   h = t.sessionId,
#                   l = t.queryParams,
#                   c = void 0 === l ? {} : l,
#                   P = t.headers;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "DELETE",
#                   endpoint: "/v1/remotePlaySessions/{sessionId}/members/me",
#                   urlParams: { sessionId: h },
#                   queryParams: c,
#                   headers: o.addCommonHeader(n, P)
#                 };
#               },
#               postRemotePlaySessionsSessionMessage: function (s, n) {
#                 var h = s || {},
#                   l = h.sessionId,
#                   c = h.queryParams,
#                   P = void 0 === c ? {} : c,
#                   v = h.headers,
#                   I = h.body;
#                 return {
#                   authType: u,
#                   apiGroup: y,
#                   languageType: p,
#                   method: "POST",
#                   endpoint: "/v1/remotePlaySessions/{sessionId}/sessionMessage",
#                   urlParams: { sessionId: l },
#                   body: I,
#                   queryParams: P,
#                   headers: t(
#                     { "Content-Type": "application/json" },
#                     o.addCommonHeader(n, v)
#                   )
#                 };
#               }
#             }),
#             defaultBaseUrls: {
#               "std:sessionManager":
#                 "https://{platform}.{npEnvironment}.playstation.net/api/sessionManager"
#             },
#             ErrorParser: n
#           };
#           return s.register(h), h;
#         }),
#         "object" == typeof e && void 0 !== m
#           ? (m.exports = n(r(d[0]), r(d[1]), r(d[2])))
#           : "function" == typeof define && define.amd
#           ? define([
#               "@sie/nimbus-core",
#               "@sie-private/nimbus-standard-error-parser",
#               "@sie-private/nimbus-common-header"
#             ], n)
#           : ((s.Nimbus = s.Nimbus || {}),
#             (s.Nimbus.sessionManager = n(
#               s.Nimbus,
#               s.Nimbus.StandardErrorParser,
#               s.Nimbus.CommonHeader
#             )));
#     },
#     1509,
#     [606, 1480, 1481]
#   );