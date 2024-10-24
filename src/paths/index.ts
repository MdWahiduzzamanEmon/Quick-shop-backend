import { authRoute } from "../routes/Auth/auth";
import { loginHistoryRoute } from "../routes/History/LoginHistory/LoginHistory";
import { adminRoute } from "../routes/users/Admin/admin";
import { employeesRoute } from "../routes/users/employees/employees";
import { allUsersRoute } from "../routes/users/getAllUsers/getAllUsers";
import { othersUsersRoute } from "../routes/users/othersUsers/othersUsers";

export const routes = [
  allUsersRoute,
  othersUsersRoute,
  authRoute,
  loginHistoryRoute,
  adminRoute,
  employeesRoute,
];
