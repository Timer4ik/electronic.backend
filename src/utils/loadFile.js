const uuid = require("uuid")
const path = require("path")

module.exports = function (req, config = { multiple: false }) {
   let photo = req?.files?.photo

   if (photo) {

      if (!config.multiple) {
         let photoName
         if (photo) {
            photo = Array.isArray(photo) ? photo[photo.length - 1] : photo
            photoName = uuid.v4() + "." + photo.name.split(".")[1]
            req.body.photo = photoName
         }
         return {
            load:() => photo.mv(path.resolve(__dirname, "../static", photoName)),
         }
      }
      else {
         let photos = Array.isArray(photo) ? photo : [photo]
         req.body.photos = []

         let photoLoaders = photos.map((photo) => {
            let photoName = uuid.v4() + "." + photo.name.split(".")[1]
            req.body.photos.push(photoName)
            return () => photo.mv(path.resolve(__dirname, "../static", photoName))
         })

         return {
            load:() => photoLoaders.forEach(mv => mv())
         }
      
      }

   }
}