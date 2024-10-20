import { authRoute } from "../routes/Auth/auth";
import { loginHistoryRoute } from "../routes/History/LoginHistory/LoginHistory";
import { allUsersRoute } from "../routes/users/getAllUsers/getAllUsers";
import { othersUsersRoute } from "../routes/users/othersUsers/othersUsers";

export const routes = [
  allUsersRoute,
  othersUsersRoute,
  authRoute,
  loginHistoryRoute,
];
