module ChatWork.Endpoints.IncomingRequestsSpec
    ( spec
    ) where

import           ChatWork.Endpoints.IncomingRequests   (acceptIncomingRequest,
                                                        getIncomingRequests,
                                                        rejectIncomingRequest)
import           ChatWork.Test.Client                  (TestClient (..))
import           ChatWork.Test.MonadHttpIO             ()
import           ChatWork.Test.Values.IncomingRequests (acceptedIncomingRequest,
                                                        incomingRequests)
import           Network.HTTP.Req                      (responseBody)
import           Test.Hspec                            (Spec, context, describe,
                                                        it, shouldReturn)

spec :: Spec
spec = do
  describe "getIncomingRequests: endpoint GET /incoming_requests" $ do
    context"correct responce" $ do
      it "should return Right myStatus response body" $ do
        (responseBody <$> getIncomingRequests TestClient) `shouldReturn` Right incomingRequests
  describe "acceptIncomingRequest: endpoint GET /incoming_requests/{request_id}" $ do
    context"correct responce" $ do
      it "should return Right acceptedIncomingRequest response body" $ do
        (responseBody <$> acceptIncomingRequest TestClient 123) `shouldReturn` Right acceptedIncomingRequest
  describe "rejectIncomingRequest: endpoint DELETE /incoming_requests/{request_id}" $ do
    context"correct responce" $ do
      it "should return Right () response body" $ do
        (responseBody <$> rejectIncomingRequest TestClient 123) `shouldReturn` Right ()
