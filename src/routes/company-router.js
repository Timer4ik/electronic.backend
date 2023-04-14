const CompanyController = require("../controllers/company-controller")

const Router = require("express").Router

const router = Router()

router.get("/companies", CompanyController.getCompanies)
router.get("/companies/:id", CompanyController.getCompanyById)
router.post("/companies", CompanyController.createCompany)
router.put("/companies/:id", CompanyController.updateCompany)
router.delete("/companies/:id", CompanyController.getCompanyById)

module.exports = router