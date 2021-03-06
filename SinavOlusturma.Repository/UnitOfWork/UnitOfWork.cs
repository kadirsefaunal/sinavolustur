﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SinavOlusturma.Repository.Repositories;
using SinavOlusturma.Repository.UnitOfWork;
using System.Data.Entity;
using SinavOlusturma.Data;

namespace SinavOlusturma.Repository.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork  
    {
        private readonly SinavDBEntities _dbContext;

        public UnitOfWork(SinavDBEntities dbContext)
        {
            Database.SetInitializer<SinavDBEntities>(null);

            if (dbContext == null)
                throw new ArgumentNullException("dbContext can not be null.");

            _dbContext = dbContext;
            
        }

        #region IUnitOfWork Members
        public IRepository<T> GetRepository<T>() where T : class
        {
            return new SinavRepository<T>(_dbContext);
        }

        public int SaveChanges()
        {
            try
            {
                return _dbContext.SaveChanges();
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region IDisposable Members
        private bool disposed = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _dbContext.Dispose();
                }
            }

            this.disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        #endregion
    }
}
