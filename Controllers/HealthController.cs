using Microsoft.AspNetCore.Mvc;

// Do not add a namespace line here, so it also sits in the global namespace

[ApiController]
[Route("api/[controller]")]
public class HealthController : ControllerBase
{
    [HttpGet]
    public IActionResult Get() => Ok("Healthy 👈😁👍");
}

