{-# LANGUAGE OverloadedStrings #-}

module ChatWork.Test.Values.My
    ( myStatus
    , myTasks
    , getMyTasksParams
    ) where

import           ChatWork.Types (Account (..), GetMyTasksParams (..),
                                 MyStatus (..), MyTask (..), MyTasks, Room (..),
                                 TaskStatus (..))

myStatus :: MyStatus
myStatus = MyStatus 2 1 3 12 1 8

myTasks :: MyTasks
myTasks = [ MyTask 3
                   (Room 5 "Group Chat Name" "https://example.com/ico_group.png")
                   (Account 456 "Anna" "https://example.com/def.png")
                   "13"
                   "buy milk"
                   1384354799
                   "open"
          ]

getMyTasksParams :: GetMyTasksParams
getMyTasksParams = GetMyTasksParams (Just 78) (Just Done)
