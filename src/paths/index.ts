import { administratorRoute } from "../routes/users/administrator/administrator";
import { allUsersRoute } from "../routes/users/getAllUsers/getAllUsers";
import { othersUsersRoute } from "../routes/users/othersUsers/othersUsers";

export const routes = [allUsersRoute, administratorRoute, othersUsersRoute];
