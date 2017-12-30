using SinavOlusturma.Data;
using SinavOlusturma.Repository.Repositories;
using SinavOlusturma.Repository.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SinavOlusturma.Business
{
    public class UserManager
    {
        private SinavDBEntities _dbContext = new SinavDBEntities();
        private IUnitOfWork _uow;
        private IRepository<User> _userRepo;

        public UserManager()
        {
            _uow = new UnitOfWork(_dbContext);
            _userRepo = new SinavRepository<User>(_dbContext);
        }

        public string LogIn(User userControl)
        {
            var user = _userRepo.Get(x => x.UserName == userControl.UserName);

            if (user != null)
            {
                if (user.Password == Sifrele(userControl.Password))
                {
                    return user.Id.ToString();
                }
                else
                {
                    return "Parola hatalı!";
                }
            }
            else
            {
                return "Kullanıcı bulunamadı!";
            }
        }

        private static string Sifrele(string password)
        {
            MD5CryptoServiceProvider sifre = new MD5CryptoServiceProvider();
            byte[] byteDegeri = Encoding.UTF8.GetBytes(password);
            byte[] sifreliByte = sifre.ComputeHash(byteDegeri);
            return Convert.ToBase64String(sifreliByte);
        }
    }
}
