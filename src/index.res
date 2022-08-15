let router = Cloudflare.initRouter()

router.get(. "/", (. _) => {
  Promise.make((resolve, _) => {
    resolve(. Cloudflare.response("foo"))
  })
})

router.all(. "*", (. _) => {
  Promise.make((resolve, _) => {                                                
    resolve(. Cloudflare.response("Not found!"))                                       
  }) 
})

Cloudflare.addEventListener("fetch", (. e) => {
  let _ = e.respondWith(. router.handle(. e.request))
})
