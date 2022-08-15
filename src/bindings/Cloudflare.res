type responseClass
@new external response: string => responseClass = "Response";

type requestType = {
  params: Belt.Map.String.t<string>,
}

type requestFn = (. string, (. requestType) => Promise.t<responseClass>) => unit

type routerType = {
  get: requestFn,
  post: requestFn,
  patch: requestFn,
  put: requestFn,
  delete: requestFn,
  all: requestFn,
  handle: (. requestType) => requestType,
}

@module("itty-router") external initRouter: unit => routerType = "Router";

type eventType = {
  request: requestType,
  respondWith: (. requestType) => unit
}

external addEventListener: (string, (. eventType) => unit) => unit = "addEventListener" 
