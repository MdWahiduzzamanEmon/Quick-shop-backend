import moment from "moment";

export type DateFilterOptions =
  | "Today"
  | "Yesterday"
  | "Last 7 days"
  | "Last 30 days"
  | "This month"
  | "Last month"
  | "This year"
  | "Last year"
  | "Custom";

interface DateRange {
  startDate: Date;
  endDate: Date;
}

// Utility function to get date range for a given filter
export const getDateRangeForFilter = (
  filter: DateFilterOptions,
  customRange?: string
): DateRange | null => {
  const today = moment().startOf("day");
  let startDate: moment.Moment | null = null;
  let endDate: moment.Moment | null = null;

  switch (filter) {
    case "Today":
      startDate = today;
      endDate = moment(today).endOf("day");
      break;
    case "Yesterday":
      startDate = moment(today).subtract(1, "days");
      endDate = moment(today).subtract(1, "days").endOf("day");
      break;
    case "Last 7 days":
      startDate = moment(today).subtract(7, "days");
      endDate = moment(today).endOf("day");
      break;
    case "Last 30 days":
      startDate = moment(today).subtract(30, "days");
      endDate = moment(today).endOf("day");
      break;
    case "This month":
      startDate = moment(today).startOf("month");
      endDate = moment(today).endOf("month");
      break;
    case "Last month":
      startDate = moment(today).subtract(1, "month").startOf("month");
      endDate = moment(today).subtract(1, "month").endOf("month");
      break;
    case "This year":
      startDate = moment(today).startOf("year");
      endDate = moment(today).endOf("year");
      break;
    case "Last year":
      startDate = moment(today).subtract(1, "year").startOf("year");
      endDate = moment(today).subtract(1, "year").endOf("year");
      break;
    case "Custom":
      if (customRange) {
        const [start, end] = customRange.split(",");
        startDate = moment(new Date(start));
        endDate = moment(new Date(end));
      }
      break;
    default:
      return null;
  }

  return startDate && endDate
    ? { startDate: startDate.toDate(), endDate: endDate.toDate() }
    : null;
};
