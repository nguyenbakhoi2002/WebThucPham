using System.Text.RegularExpressions;
using System.Text;
using System.Net.NetworkInformation;
using System.Security.Policy;

namespace WebThucPham.Helpper
{
    public static class Utilities
    {
        public static string StripHTML(string input)
        {
            try
            {
                if (!string.IsNullOrEmpty(input))
                {
                    return Regex.Replace(input, "<.*?>", String.Empty);
                }
            }
            catch
            {
                return null;
            }
            return null;
        }
        public static bool IsValidEmail(string email)
        {
            if (email.Trim().EndsWith("."))
            {
                return false;
            }
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        public static int PAGE_SIZE = 20;
        public static void CreateIfMissing(string path)
        {
            bool folderExists = Directory.Exists(path);
            if (!folderExists)
                Directory.CreateDirectory(path);
        }
        //được sử dụng để chuyển đổi một chuỗi bất kỳ thành chuỗi có dạng viết hoa chữ cái đầu tiên
        public static string ToTitleCase(string str)
        {
            string result = str;
            if (!string.IsNullOrEmpty(str))
            {
                var words = str.Split(' ');
                for (int index = 0; index < words.Length; index++)
                {
                    var s = words[index];
                    if (s.Length > 0)
                    {
                        words[index] = s[0].ToString().ToUpper() + s.Substring(1);
                    }
                }
                result = string.Join(" ", words);
            }
            return result;
        }
        public static bool IsInteger(string str)
        {
            Regex regex = new Regex(@"^[0-9]+$");

            try
            {
                if (String.IsNullOrWhiteSpace(str))
                {
                    return false;
                }
                if (!regex.IsMatch(str))
                {
                    return false;
                }

                return true;

            }
            catch
            {

            }
            return false;

        }
        public static string GetRandomKey(int length = 5)
        {
            //chuỗi mẫu (pattern)
            string pattern = @"0123456789zxcvbnmasdfghjklqwertyuiop[]{}:~!@#$%^&*()+";
            Random rd = new Random();
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < length; i++)
            //rd.Next(0, pattern.Length) trả về số ngẫu nhiên (0, độ dài của pattern)
            {
                sb.Append(pattern[rd.Next(0, pattern.Length)]);
            }

            return sb.ToString();
        }
        //Hàm SEOUrl có nhiệm vụ chuyển đổi một chuỗi url thành một chuỗi url thân thiện với các công cụ tìm kiếm và dễ đọc cho người dùng.
        //Cụ thể, hàm sẽ thực hiện các bước sau
        //Chuyển chuỗi url về chữ thường.
        //Sử dụng biểu thức chính quy (regex) để loại bỏ các ký tự đặc biệt trong chuỗi url và thay thế các ký tự tiếng Việt thành các ký tự tương ứng trong tiếng Anh.
        //Loại bỏ khoảng trắng ở đầu và cuối chuỗi url.
        //Thay các khoảng trắng trong chuỗi url thành dấu gạch ngang.
        //Kiểm tra và loại bỏ các trường hợp có hai dấu gạch ngang liên tiếp trong chuỗi url.
        //Cuối cùng, hàm trả về chuỗi url đã được chuyển đổi.
        public static string SEOUrl(string url)
        {
            url = url.ToLower();
            url = Regex.Replace(url, @"[áàạảãâấầậẩẫăắằặẳẵ]", "a");
            url = Regex.Replace(url, @"[éèẹẻẽêếềệểễ]", "e");
            url = Regex.Replace(url, @"[óòọỏõôốồộổỗơớờợởỡ]", "o");
            url = Regex.Replace(url, @"[íìịỉĩ]", "i");
            url = Regex.Replace(url, @"[ýỳỵỉỹ]", "y");
            url = Regex.Replace(url, @"[úùụủũưứừựửữ]", "u");
            url = Regex.Replace(url, @"[đ]", "d");

            //2. Chỉ cho phép nhận:[0-9a-z-\s]
            url = Regex.Replace(url.Trim(), @"[^0-9a-z-\s]", "").Trim();
            //xử lý nhiều hơn 1 khoảng trắng --> 1 kt (khoảng trắng )
            url = Regex.Replace(url.Trim(), @"\s+", "-");
            //thay khoảng trắng bằng -
            url = Regex.Replace(url, @"\s", "-");
            while (true)
            {
                if (url.IndexOf("--") != -1)
                {
                    url = url.Replace("--", "-");
                }
                else
                {
                    break;
                }
            }
            return url;
        }
        // hàm upload 
        //Kiểm tra nếu newname bằng null thì sử dụng tên file gốc(file.FileName).
        //Tạo đường dẫn đến thư mục lưu trữ file ảnh.
        //Tạo đường dẫn đến file ảnh cần lưu trữ.
        //Kiểm tra loại file ảnh có hợp lệ hay không (được phép upload các file ảnh có định dạng là jpg, jpeg, png, gif).
        //Nếu loại file ảnh không hợp lệ, trả về null.
        //Nếu loại file ảnh hợp lệ, thực hiện upload file ảnh lên server và trả về tên file ảnh mới được lưu trữ.Nếu có lỗi xảy ra trong quá trình upload, phương thức trả về null.
        public static async Task<string> UploadFile(Microsoft.AspNetCore.Http.IFormFile file, string sDirectory, string newname = null)
        {
            try
            {
                if (newname == null) newname = file.FileName;
                string path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images", sDirectory);
                CreateIfMissing(path);
                string pathFile = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images", sDirectory, newname);
                var supportedTypes = new[] { "jpg", "jpeg", "png", "gif" };
                var fileExt = System.IO.Path.GetExtension(file.FileName).Substring(1);
                if (!supportedTypes.Contains(fileExt.ToLower())) /// Khác các file định nghĩa
                {
                    return null;
                }
                else
                {
                    using (var stream = new FileStream(pathFile, FileMode.Create))
                    {
                        await file.CopyToAsync(stream);
                    }
                    return newname;
                }
            }
            catch
            {
                return null;
            }
        }
    }
}
