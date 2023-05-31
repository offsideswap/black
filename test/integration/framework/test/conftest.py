import pytest
import blacktool.test_utils


@pytest.fixture(scope="function")
def ctx(request):
    yield from blacktool.test_utils.pytest_ctx_fixture(request)


@pytest.fixture(autouse=True)
def test_wrapper_fixture():
    blacktool.test_utils.pytest_test_wrapper_fixture()
