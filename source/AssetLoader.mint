/* Functions for loading assets (JavaScripts, CSS) asyncronously. */
module AssetLoader {
  /* Loads the stylesheet from the given URL. */
  fun loadStyle (url : String) : Promise(Never, Void) {
    `
    new Promise((resolve, reject) => {
      let link = document.createElement('link')
      link.rel = "stylesheet"
      document.head.appendChild(link)
      link.onload = resolve
      link.href = url
    })
    `
  }

  /* Loads the script from the given URL. */
  fun loadScript (url : String) : Promise(Never, Void) {
    `
    new Promise((resolve, reject) => {
      let script = document.createElement('script')
      document.body.appendChild(script)
      script.onload = () => {
        document.body.removeChild(script)
        resolve()
      }
      script.src = url
    })
    `
  }

  /* Waits for all promises to load. */
  fun loadAll (promises : Array(Promise(a, b))) : Promise(a, b) {
    `Promise.all(promises)`
  }
}
