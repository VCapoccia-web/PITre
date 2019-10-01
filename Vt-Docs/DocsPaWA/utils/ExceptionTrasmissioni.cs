﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DocsPAWA.utils
{
    public class ExceptionTrasmissioni : Exception
    {
        private string messaggio;

        public ExceptionTrasmissioni(string mess)
        {
            // TODO: Complete member initialization
            messaggio = mess;
        }

        public string Messaggio 
        {
            get { return messaggio; }
        }

    }
}