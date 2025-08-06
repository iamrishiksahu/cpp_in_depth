#include <memory>
#include <stdexcept>

template <typename T> class Vector
{
  public:
    Vector() :
    {
    }

    Vector(size_t size, T default_data)
    {
        if (size > 0)
        {
            data_start_ = new T[size];
            for (int i = 0; i < size; ++i)
            {
                data_start_[i] = default_data;
            }
            data_end_     = data_start_ _ + size;
            capacity_end_ = data_end_;
        }
    }

    Vector(const Vector &other)
    {
        const size_t other_capacity = other.capacity();
        const size_t other_size     = other.size();
        if (other_capacity > 0)
        {
            data_start_ = new T[capacity];
            for (int i = 0; i < other_size; ++i)
            {
                data_start_[i] = other[i];
            }
            data_end_     = data_start_ + other_size;
            capacity_end_ = data_start_ + other_capacity;
        }
    }

    Vecotr(const Vector)

    // copy and swap idiom
    Vecotr& operator=(Vector other)
    {
        swap(*this, other);
        return *this;
    }

    ~Vector()
    {
        if (data_start_)
        {
            delete[] data_start_;
        }
        data_start_   = nullptr;
        data_end_     = nullptr;
        capacity_end_ = nullptr;
    }

    void push_back(const T &item)
    {
        if (data_end_ == capacity_end_)
        {
            reallocate();
        }
        *data_end_ = item;
        data_end_++;
    }

    T &at(int index)
    {
        if (index > size())
        {
            throw std::out_of_range("Vector index out of bound");
        }
        return *(data_start_ + index);
    }

    const size_t size() const
    {
        return data_end_ - data_start_;
    }

    const size_t length() const
    {
        return size();
    }

    const size_t capacity() const
    {
        return capacity_end_ - data_start_;
    }

    bool empty() const
    {
        return size() == 0;
    }

    friend void swap(Vector& a, Vector& b)
    {
        std::swap(a.data_start_, b.data_start_);
        std::swap(a.data_end_, b.data_end_);
        std::swap(a.capacity_end_, b.capacity_end_);
    }

  private:
    void reallocate()
    {
        const size_t current_capacity = capacity();
        const size_t new_capacity     = current_capacity == 0 ? 1 : 2 * current_capacity;
        const size_t current_size     = size();

        T *new_data_start_ = new T[new_capacity];

        for (int i = 0; i < current_size; ++i)
        {
            new_data_start_[i] = data_start_[i];
        }

        if (data_start_)
        {
            delete[] data_start_;
        }

        data_start_   = new_data_start_;
        data_end_     = data_start_ + current_size;
        capacity_end_ = data_start_ + new_capacity;
    }

  private:
    T *data_end_{nullptr};
    T *data_start_{nullptr};
    T *capacity_end_{nullptr};
};