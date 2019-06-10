﻿using System;
using System.ComponentModel.DataAnnotations.Schema;
using Kigg.DomainObjects;

namespace Kigg.Infrastructure.EF.DomainObjects
{
    public class StoryMarkAsSpam: Entity, IMarkAsSpam
    {
        public System.Guid StoryId { get; set; }
        public Story Story { get; set; }

        public System.Guid UserId { get; set; }
        public User User { get; set; }

        public string IPAddress { get; set; }

        public System.DateTime Timestamp { get; set; }

        [NotMapped]
        public IStory ForStory => Story;

        [NotMapped]
        public IUser ByUser => User;

        [NotMapped]
        public string FromIPAddress => IPAddress;

        [NotMapped]
        public DateTime MarkedAt => Timestamp;
    }
}