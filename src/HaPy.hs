module HaPy where

import Data.Text

newtype PythonCode = PythonCode { code :: Text }

class PythonImplementation pi where
  execute :: pi
          -> PythonCode  -- ^ Python code
          -> Text  -- ^ Input buffer
          -> IO (Text, Text)  -- ^ Output (stdout, stderr)

