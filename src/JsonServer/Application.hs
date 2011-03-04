module JsonServer.Application
  ( Application
  , applicationInitializer
  ) where

import           Snap.Extension

type Application = SnapExtend ApplicationState
data ApplicationState = ApplicationState

applicationInitializer :: Initializer ApplicationState
applicationInitializer = do
    return $ ApplicationState
