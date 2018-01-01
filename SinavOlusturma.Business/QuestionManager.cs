using SinavOlusturma.Data;
using SinavOlusturma.Data.ModelView;
using SinavOlusturma.Repository.Repositories;
using SinavOlusturma.Repository.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SinavOlusturma.Business
{
    public class QuestionManager
    {
        private SinavDBEntities _dbContext = new SinavDBEntities();
        private IUnitOfWork _uow;
        private IRepository<Question> _QuestionRepo;

        public QuestionManager()
        {
            _uow = new UnitOfWork(_dbContext);
            _QuestionRepo = new SinavRepository<Question>(_dbContext);
        }

        public bool SaveQuestion(Question question, Guid examID)
        {
            try
            {
                question.Id = Guid.NewGuid();
                question.ExamId = examID;
                _QuestionRepo.Add(question);
                _uow.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool DeleteQuestion(Question q)
        {
            try
            {
                _QuestionRepo.Delete(q);
                _uow.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool CheckQuestion(AnswerModel question)
        {
            var q = _QuestionRepo.Get(x => x.Id == question.Id);
            if (q.Answer == question.Answer)
                return true;
            else
                return false;

        }
    }
}
