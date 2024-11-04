import { vendorRoute } from "../routes/Vendor/vendor";
import { authRoute } from "../routes/Auth/auth";
import { loginHistoryRoute } from "../routes/History/LoginHistory/LoginHistory";
import { product_categoryRoute } from "../routes/product_category/product_category";
import { adminRoute } from "../routes/users/Admin/admin";
import { employeesRoute } from "../routes/users/employees/employees";
import { allUsersRoute } from "../routes/users/getAllUsers/getAllUsers";
import { othersUsersRoute } from "../routes/users/othersUsers/othersUsers";
import { getConnectedUsersRoute } from "../routes/getConnectedUsers/getConnectedUsers";
import { zoneRoute } from "../routes/Zone/zone";
import { bd_locationsRoute } from "../routes/BD_location/BD_location";
import { productsRouter } from "../routes/Products/products";
import { suppliersRouter } from "../routes/Suppliers/suppliers";
import { productStockPurchaseRouter } from "../routes/product_stock_purchase/product_stock_purchase";

export const routes = [
  vendorRoute,
  allUsersRoute,
  othersUsersRoute,
  authRoute,
  loginHistoryRoute,
  adminRoute,
  employeesRoute,
  product_categoryRoute,
  getConnectedUsersRoute,
  zoneRoute,
  bd_locationsRoute,
  productsRouter,
  suppliersRouter,
  productStockPurchaseRouter,
];
