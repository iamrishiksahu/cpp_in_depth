#include <memory>
#include <stdexcept>

namespace My
{

template <typename T> class Vector
{
  public:
    using iterator       = T *;
    using const_iterator = const T *;

    Vector()
    {
    }

    ~Vector() noexcept
    {
        if (data_start_)
        {
            delete[] data_start_;
        }
        data_start_   = nullptr;
        data_end_     = nullptr;
        capacity_end_ = nullptr;
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

            data_end_     = data_start_ + size;
            capacity_end_ = data_end_;
        }
    }

    Vector(const Vector &other)
    {
        const size_t other_capacity = other.capacity();
        const size_t other_size     = other.size();
        if (other_capacity > 0)
        {
            data_start_ = new T[other_capacity];
            for (int i = 0; i < other_size; ++i)
            {
                data_start_[i] = other[i];
            }
            data_end_     = data_start_ + other_size;
            capacity_end_ = data_start_ + other_capacity;
        }
    }

    Vector(Vector &&other) noexcept
    {
        data_start_   = other.data_start_;
        data_end_     = other.data_end_;
        capacity_end_ = other.capacity_end_;

        other.data_start_   = nullptr;
        other.data_end_     = nullptr;
        other.capacity_end_ = nullptr;
    }

    Vector &operator=(Vector &&other) noexcept
    {
        if (this != &other)
        {
            if (data_start_)
            {
                delete[] data_start_;
            }

            data_start_   = other.data_start_;
            data_end_     = other.data_end_;
            capacity_end_ = other.capacity_end_;

            other.data_start_   = nullptr;
            other.data_end_     = nullptr;
            other.capacity_end_ = nullptr;
        }
        return *this;
    }

    Vector &operator=(Vector other)
    {
        swap(*this, other);
        return *this;
    }

    const T &operator[](int index) const
    {
        return data_start_[index];
    }

    T &operator[](int index)
    {
        return data_start_[index];
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

    const T &back() const
    {
        return *(data_end_ - 1);
    }

    T &back()
    {
        return *(data_end_ - 1);
    }

    T &at(int index)
    {
        if (index < 0 || index >= size())
            throw std::out_of_range("Index out of bounds");
        return data_start_[index];
    }

    const T &at(int index) const
    {
        if (index < 0 || index >= size())
            throw std::out_of_range("Index out of bounds");
        return data_start_[index];
    }

    const_iterator begin() const
    {
        return data_start_;
    }

    iterator begin()
    {
        return data_start_;
    }

    const_iterator end() const
    {
        return data_end_;
    }

    iterator end()
    {
        return data_end_;
    }

    T *insert(const_iterator pos_item, const T &new_element)
    {
        const size_t insert_offset = pos_item - data_start_;

        if (data_end_ == capacity_end_)
        {
            reallocate();
            // re-calculate insertion position as the pointers have changed
            pos_item = data_start_ + insert_offset;
        }

        for (iterator i = data_end_; i != pos_item; --i)
        {
            data_end_[i] = data_end_[i - 1];
        }

        data_start_[insert_offset] = new_element;
        data_end_++;

        return data_start_ + insert_offset;
    }

    const size_t size() const noexcept
    {
        return data_end_ - data_start_;
    }

    const size_t length() const noexcept
    {
        return size();
    }

    const size_t capacity() const noexcept
    {
        return capacity_end_ - data_start_;
    }

    bool empty() const noexcept
    {
        return size() == 0;
    }

    friend void swap(Vector &a, Vector &b) noexcept
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

    inline void throw_out_of_bound()
    {
        throw std::out_of_range("Vector index out of bound");
    }

  private:
    T *data_end_{nullptr};
    T *data_start_{nullptr};
    T *capacity_end_{nullptr};
};
} // namespace My