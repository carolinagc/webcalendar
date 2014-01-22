module CalendarHelper
  def calendar(num_weeks = "4", date = Date.today, &block)
    Calendar.new(self, num_weeks, date, block).table
  end

  class Calendar < Struct.new(:view, :num_weeks, :date, :callback)
    HEADER = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
#    START_DAY = :Monday

    delegate :content_tag, to: :view

    def table
      content_tag :table, class: "calendar" do
          header + week_rows(num_weeks)
        end
   end

      def header
        content_tag :tr do
          HEADER.map {|day| content_tag :th, day}.join.html_safe
        end
      end
  
      def week_rows(num_weeks)
        weeks(num_weeks).map  do |week|
          content_tag :tr do
            week.map{|day| day_cell(day)}.join.html_safe
          end
        end.join.html_safe
      end
  
   
      def day_cell(day)
        content_tag :td, view.capture(day, &callback), class: day_classes(day)
      end

      def day_classes(day)
        classes = []
        classes << "today" if day == Date.today
        classes << "notmonth" if day.month != date.month
        classes.empty? ? nil : classes.join(" ")
      end

      def weeks(num_weeks)

        if num_weeks.to_i==1
          first = date.beginning_of_week
          last = date.end_of_week
        else
          first = date.beginning_of_month.beginning_of_week
          last = date.end_of_month.end_of_week
        end
        (first..last).to_a.in_groups_of(7)
      end
    end
  end
