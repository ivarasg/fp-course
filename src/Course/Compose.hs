{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Course.Compose where

import Course.Core
import Course.Functor
import Course.Applicative
import Course.Monad

-- Exactly one of these exercises will not be possible to achieve. Determine which.

newtype Compose f g a = Compose (f (g a))

-- Implement a Functor instance for Compose
instance (Functor f, Functor g) => Functor (Compose f g) where
  -- (<$>) :: (a -> b) -> Compose f g a -> Compose f g b
  h <$> Compose c = Compose $ (h <$>) <$> c
    -- error "todo: Course.Compose (<$>)#instance (Compose f g)"

instance (Applicative f, Applicative g) => Applicative (Compose f g) where
-- Implement the pure function for an Applicative instance for Compose
  -- pure :: a -> Compose f g a
  pure x = Compose $ pure (pure x)
    -- error "todo: Course.Compose pure#instance (Compose f g)"
-- Implement the (<*>) function for an Applicative instance for Compose
  -- (<*>) :: Compose f g (a -> b) -> Compose f g a -> Compose f g b
  Compose cf <*> Compose ca = Compose $ ((<*>) <$> cf) <*> ca
    -- error "todo: Course.Compose (<*>)#instance (Compose f g)"

instance (Monad f, Monad g) => Monad (Compose f g) where
-- Implement the (=<<) function for a Monad instance for Compose
  -- (=<<) :: (a -> Compose f g b) -> Compose f g a -> Compose f g b
  (=<<) =
    error "No se puede hacer!"
