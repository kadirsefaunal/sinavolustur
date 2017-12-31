using SinavOlusturma.Data;
using SinavOlusturma.Repository.Repositories;
using SinavOlusturma.Repository.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SinavOlusturma.Business
{
    public class ExamManager
    {
        private SinavDBEntities _dbContext = new SinavDBEntities();
        private IUnitOfWork _uow;
        private IRepository<Exam> _ExamRepo;

        public ExamManager()
        {
            _uow = new UnitOfWork(_dbContext);
            _ExamRepo = new SinavRepository<Exam>(_dbContext);
        }

        public bool SaveExam(Exam exam)
        {
            try
            {
                _ExamRepo.Add(exam);
                _uow.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<Exam> GetAllExam()
        {
            return _ExamRepo.GetAll().OrderByDescending(x => x.Date).ToList();
        }
    }
}
