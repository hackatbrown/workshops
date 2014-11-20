{-# LANGUAGE LambdaCase #-}
module Test where
lMap :: (a -> b) -> [a] -> [b]
lMap f = \case
            [] -> []
            (x:xs) ->(f x):(lMap f xs)
