using Plots
using DifferentialEquations


N = 18354
I₀ = 102
R₀ = 100
S₀ = N - I₀ - R₀
α = 0.01
β = 0.03

function ode_fn₁(du, u, p, t)
    du[1] = 0
    du[2] = -β*u[2]
    du[3] = β*u[2]
end
function ode_fn₂(du, u, p, t)
    du[1] = -α*u[1]
    du[2] = α*u[1] - β*u[2]
    du[3] = β*u[2]
end

tspan = (0.0, 200.0)
prob₁ = ODEProblem(ode_fn₁, [S₀, I₀, R₀], tspan)
prob₂ = ODEProblem(ode_fn₂, [S₀, I₀, R₀], tspan)
sol₁ = solve(prob₁, dtmax=0.01)
sol₂ = solve(prob₂, dtmax=0.01)

S₁ = [u[1] for u in sol₁.u]
I₁ = [u[2] for u in sol₁.u]
R₁ = [u[3] for u in sol₁.u]
S₂ = [u[1] for u in sol₂.u]
I₂ = [u[2] for u in sol₂.u]
R₂ = [u[3] for u in sol₂.u]
T = [t for t in sol₁.t]

plt = plot(dpi=300, legend=:right)
plot!(plt, T, S₁, label="Восприимчивые особи", color=:purple)
plot!(plt, T, I₁, label="Инфицированные особи", color=:blue)
plot!(plt, T, R₁, label="Особи с иммунитетом", color=:green)
savefig(plt, "model1.png")

plt2 = plot(dpi=300, legend=:right)
plot!(plt2, T, S₂, label="Восприимчивые особи", color=:purple)
plot!(plt2, T, I₂, label="Инфицированные особи", color=:blue)
plot!(plt2, T, R₂, label="Особи с иммунитетом", color=:green)
savefig(plt2, "model2.png")