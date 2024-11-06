import moment from "moment";

export const convertIsoDate = (date: string | Date) => {
  if (date) {
    return moment(date).toISOString();
  }
};
