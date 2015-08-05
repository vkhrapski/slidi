( ->
	angular
		.module 'slidiApp'
		.controller 'PictureRepositoryCtrl', ($scope, $modalInstance) ->
		  $scope.ok = () ->
		    $modalInstance.close

		  $scope.cancel = () ->
		    $modalInstance.dismiss 'cancel'
)()