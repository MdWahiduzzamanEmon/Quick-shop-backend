import { vendorRoute } from "../routes/Vendor/vendor";
import { authRoute } from "../routes/Auth/auth";
import { loginHistoryRoute } from "../routes/History/LoginHistory/LoginHistory";
import { product_categoryRoute } from "../routes/product_category/product_category";
import { adminRoute } from "../routes/users/Admin/admin";
import { employeesRoute } from "../routes/users/employees/employees";
import { allUsersRoute } from "../routes/users/getAllUsers/getAllUsers";
import { othersUsersRoute } from "../routes/users/othersUsers/othersUsers";

export const routes = [
  vendorRoute,
  allUsersRoute,
  othersUsersRoute,
  authRoute,
  loginHistoryRoute,
  adminRoute,
  employeesRoute,
  product_categoryRoute,
];
