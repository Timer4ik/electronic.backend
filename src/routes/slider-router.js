const SliderController = require("../controllers/slider-controller")

const Router = require("express").Router

const router = Router()

router.get("/sliders", SliderController.getSliders)
router.get("/slider/:id", SliderController.getSliderById)
router.post("/slider", SliderController.createSlider)
router.put("/slider/:id", SliderController.updateSlider)

module.exports = router