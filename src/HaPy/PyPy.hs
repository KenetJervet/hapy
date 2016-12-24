{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE RecordWildCards          #-}

module HaPy.PyPy where

import           Data.ByteString    as BS
import           Data.Text          as T
import           Data.Text.Encoding
import           Foreign
import           Foreign.C.String
import           Foreign.C.Types
import           HaPy

data PyPy = PyPy

instance PythonImplementation PyPy where
  execute PyPy PythonCode{..} _ = useAsCString (encodeUtf8 code) $ \cs -> do
    _ <- executePyPy cs
    return (T.empty, T.empty)

foreign import ccall "c/pypy.c execute"
  executePyPy :: CString -> IO CInt
