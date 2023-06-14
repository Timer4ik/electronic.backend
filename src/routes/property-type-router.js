const PropertyTypeController = require("../controllers/property-types-controller")

const Router = require("express").Router

const router = Router()

router.get("/property-types", PropertyTypeController.getPropertyTypes)
router.get("/property-types/:id", PropertyTypeController.getPropertyTypeById)
router.post("/property-types", PropertyTypeController.createPropertyType)
router.put("/property-types/:id", PropertyTypeController.updatePropertyType)
router.delete("/property-types/:id", PropertyTypeController.deletePropertyType)

module.exports = router