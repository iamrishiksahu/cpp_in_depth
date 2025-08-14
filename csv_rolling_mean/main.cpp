/**
 * PROBLEM_STATEMENT:
 *
 * We want to calculate the rolling mean of a column in sample.csv
 * and put that rolling mean into a different column in a separate
 * output file.
 */

#include <fstream>
#include <iostream>
#include <optional>
#include <queue>
#include <string>
#include <vector>

template <typename data_type> class RollingMean
{
  public:
    RollingMean(int window) : window_(window)
    {
    }

    std::optional<data_type> push(data_type val)
    {
        rolling_data.push_back(val);
        rolling_sum += val;
        if (rolling_data.size() > window_)
        {
            rolling_sum -= rolling_data.front();
            rolling_data.pop_front();
        }

        if (rolling_data.size() == window_)
        {
            return rolling_sum / window_;
        }
        return std::nullopt;
    }

  private:
    int                   window_ = 10;
    std::deque<data_type> rolling_data;
    data_type             rolling_sum = 0;
};

class Processor
{
  public:
    Processor(int window) : window_(window)
    {
    }
    void Process(const std::string &file_path, const std::string &output_file_path)
    {
        std::ifstream ifs(file_path);
        if (!ifs)
        {
            std::cout << "Error reading the file\n";
        }

        std::ofstream out_stream(output_file_path);
        if (!out_stream)
        {
            std::cout << "Error writing the file\n";
        }

        std::string header_row;
        getline(ifs, header_row);

        auto columns = ExtractValuesFromLine(header_row);

        columns.push_back("Rolling Ratio");

        out_stream << JoinValuestoFormLine(columns) << "\n";

        // Instantiate the rolling mean utility
        RollingMean<float> rm(window_);

        std::string line;
        while (getline(ifs, line))
        {

            // extract the data of the row
            std::vector<std::string> row_data = ExtractValuesFromLine(line);
            std::string              ratio    = row_data[ratio_index_];

            float ratio_val = std::stof(ratio.c_str());

            std::optional<float> mean = rm.push(ratio_val);

            if (mean.has_value())
            {
                std::string val = std::to_string(mean.value());
                row_data.push_back(val);
            }
            else
            {
                row_data.push_back("");
            }

            out_stream << JoinValuestoFormLine(row_data) << "\n";
        }
    }

  private:
    std::string JoinValuestoFormLine(const std::vector<std::string> &values)
    {
        std::string output;
        for (size_t i = 0; i < values.size(); i++)
        {
            if (i > 0)
                output += ',';
            output += values[i];
        }

        return output;
    }
    std::vector<std::string> ExtractValuesFromLine(const std::string &line)
    {
        std::vector<std::string> output;
        std::string              current_val;
        for (auto i = 0; i < line.size(); i++)
        {
            char c = line[i];
            if (c == ',')
            {
                output.push_back(current_val);
                current_val.clear();
            }
            else
            {
                current_val += c;
            }
        }

        output.push_back(current_val);
        return output;
    }

  private:
    int ratio_index_ = 4;
    int window_      = 0;
};

int main()
{

    int         window      = 10;
    std::string input_file  = "XYZ_demo.csv";
    std::string output_file = "Rishik.csv";
    Processor   processor(window);
    processor.Process(input_file, output_file);

    return 0;
}