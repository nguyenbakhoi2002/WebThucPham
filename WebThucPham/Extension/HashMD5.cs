using Microsoft.SqlServer.Server;
using System.Security.Cryptography;
using System.Text;

namespace WebThucPham.Extension
{
    // dùng để mã hóa mật khẩu 
    public static class HashMD5
    {
        //Tạo đối tượng MD5CryptoServiceProvider để thực hiện mã hóa.
        //Sử dụng phương thức ComputeHash để mã hóa dữ liệu đầu vào thành một mảng byte bHash.
        //Sử dụng đối tượng StringBuilder để tạo chuỗi kết quả mã hóa từ mảng byte bHash. Phương thức Format được sử dụng để định dạng kết quả ra chuỗi HEX.
        //Trả về chuỗi kết quả.
        public static string ToMD5(this string str)
        {
            //MD5CryptoServiceProvider là lớp cung cấp chức năng băm thông điệp
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] bHash = md5.ComputeHash(Encoding.UTF8.GetBytes(str));
            // Sử dụng StringBuilder thay cho việc nối chuỗi truyền thống giúp tối ưu hóa hiệu suất
            // và giảm thiểu sử dụng bộ nhớ. Nó cung cấp một số phương thức và thuộc tính để thao tác với các chuỗi,
            // bao gồm Append, Insert, Remove, Replace, Length, Capacity, và nhiều hơn nữa.
            StringBuilder sbHash = new StringBuilder();
            foreach (byte b in bHash)
                sbHash.Append(String.Format("{0:x2}", b));
                //x kí hiệu đổi về hexa
                //2 kí hiệu hiện 2 số
                //vd nếu b = 15 = 1111 = f -> 0f(thiếu kí tự nên thêm ko vào đầu)
                //vd nếu b = 255 = 1111 1111 = ff -> ff
                //vd nếu b = 225 = 1110 0001 = e1e -> e1

            return sbHash.ToString();
        }

    }
}
